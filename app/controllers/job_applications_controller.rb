class JobApplicationsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :application_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid_application
    skip_before_action :authorize

    def show
        application = JobApplication.all
        render json: application
    end

   def apply 
        
    application = JobApplication.create!(job_application_params)
    
    check_resume(application)    
    
    if application.valid?
        application.save
        render json: application, status: 200
    else
        render json: { errors: ["Invalid application"] }, status: 422
    end
   end

    def company_application
        employee = Employee.find!(id: params[:id])
        comapny = employee.company
        render json: applications, status: 200
    end

    def my_applications
        applications = @Current_user.job_applications.all
        render json: applications, status: :ok
    end

    

    def show_job_applications
        job_applications = JobApplication.where(job_id: params[:id])
        render json: job_applications.order(created_at: :desc) , status: :ok        
    end



    private 

    def job_application_params
        params.require(:job_application).permit(:avaliability, :sponsorship, :work_authorization, :resume, :user_id, :job_id).select {|x,v| v.present?}
    end

    def job_application_not_found
        render json: {errors: ['Application not found'] }, status: :not_found
    end
    def not_valid_application invalid_application
        render json: { errors: invalid_application.record.errors.full_messages }, status: 422
    end

    def check_resume(job_application)
        unless job_application.resume.attached?
            render json: {errors: ['Resume not attached'] }, status: :not_found    
       end
   end

end
