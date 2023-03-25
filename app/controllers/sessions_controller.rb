class SessionsController < ApplicationController
    skip_before_action :authorize
  
    def create
      user = User.find_by(username: params[:username])  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id        
        if user.employee_data == true               
          render json: user.employee_data, status: :ok          
        else            
          render json: user, status: :ok
        end       
      else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
      head :no_content
    end
end
