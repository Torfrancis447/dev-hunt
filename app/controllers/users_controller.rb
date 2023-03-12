class UsersController < ApplicationController
    skip_before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid_user
    rescue_from ActiveRecord::RecordNotFound , with: :user_not_found
    # before_action :authorize

    def create        
       user = User.create!(user_params)
       session[:user_id] = user.id  
        check_image(user) 
        if user.is_employer                     
            employee = Employee.create!(user_id: user.id, company_id: params[:user][:company_id])
            render json: user.employee_data, status: :created 
        else
            render json: user, status: :created
        end
    end
    
    def edit
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :ok
    end

    def me
        user= User.find_by(id: params[:id])       
        session[:user_id] = user.id           
        if user.employee_data === true               
          render json: user.employee_data, status: :ok          
        else            
          render json: user, status: :ok
        end
    end


    def employee
        employee = Employee.find_by(user_id: params[:id])
        if employee
            session[:employee_id] = employee.id
        end
    end

    # def job_applications
      
    #     user = Employee.find_by(employee_id: session[:user_id])
    #     applications
        
    #     if applications
    #         render json: applications, status: :ok
    #     else
    #         render json: {errors: ['Application not found']}, status: 404
    #     end
    # end

    def check_image(user)
        unless user.image.attached?
            user.image.attach(io: File.open(Rails.root.join('app', 'assets', 'avatardefault_92824.png')), filename: 'avatardefault_92824.png' , content_type: 'image/png')      
       end
    end
   
    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :name, :is_employer, :email, :image).select {|x,v| v.present?}
    end

    def not_valid_user invalid_user
        render json: { errors: invalid_user.record.errors.full_messages }, status: 422
    end

    def employee_params
        params.require(:employee).permit(:user_id, :company_id)
    end
    def user_not_found
        render json: {errors: ['User not found'] }, status: :not_found
    end
end
# skip_before_action :authorize, only: [:create]