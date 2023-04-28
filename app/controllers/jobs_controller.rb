class JobsController < ApplicationController
    skip_before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid
    rescue_from ActiveRecord::RecordNotFound , with: :job_not_found
    
    def index
        render json: Job.all, status: :ok
    end
    def create        
        job = Job.create!(job_params)
        job_skills = [
            JobSkill.new(job: job, skill: Skill.find_by(name: "Ruby"))
            ]
        if skill.valid?
            render json: job , status: :created
        else
            render json: {errors: ['Skill not valid']}
        end
        
    end

    def searched
        jobs = Job.where(location_type: params[:location_type], employment_type: params[:employment_type])
        render json: jobs
    end

    def edit
        job = Job.find(params[:id])
        job.update!(job_params)
        
        render json: job, status: :created
    end

   def company_jobs
        company = Company.find_by(employee_id: params[:id])
        if company            
            render json: company.job_applications, status: :ok
        else
            render json: { errors: ['Company not Found'] }, status: 404
        end
   end

   def destroy
      job = Job.find(params[:id])
      job.destroy
      head :no_content
   end

    private

    def job_params
        params.require(:job).permit(:description, :compensation_type, :compensation, :location_type, :employment_type, :location, :title, :company_id )
    end
    
    

    def not_valid invalid_job
        render json: { errors: invalid_job.record.errors.full_messages }, status: 422
    end

    def job_not_found
        render json: {errors: ['Job not found'] }, status: :not_found
    end
end
