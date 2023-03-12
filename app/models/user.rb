class User < ApplicationRecord
    has_one_attached :image
    has_many :job_applications, dependent: :destroy
    has_many :jobs, through: :job_applications
    has_many :employees
    has_secure_password
    

    def jobs_applied_to
        self.job_applications.count
    end 

    def count_created_within_month
        self.job_applications.where(created_at: created_at.beginning_of_month..created_at.end_of_month).count
    end    
    
    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end

    def uncreated_jobs
        Job.where.not(id: self.jobs.pluck(:id))
    end
    
    
    def employee_data
        employees.map do |employee|
          {
            
            jobs: get_job_applications(employee),
            company: employee.company,
            
          }          
        end
    end

    def get_job_applications employee
        employee.company.jobs.map do |job|
            {
                applications: get_applicant(job),
                description: job.description,
                id: job.id,
                location: job.location,
                compensation_type: job.compensation_type,
                compensation: job.compensation,
                employment_type: job.employment_type,
                title: job.title,
                application_count: job.application_count,
                company: job.company_id, 
                location_type: job.location_type,
                skills: job.skills
            }
        end
    end

    def get_applicant job
        job.job_applications.map do |job_application|
            {
                id:job_application.id,
                avaliability: job_application.avaliability,
                sponsorship: job_application.sponsorship,
                work_authorization: job_application.work_authorization,
                resume: job_application.resume_url
            }
        end
        
    end
end
