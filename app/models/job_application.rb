class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_one_attached :resume
    validate :job_presence
    validate :resume_attached

    def count_created_within_month
        self.where(created_at: created_at.beginning_of_month..created_at.end_of_month).count
    end
    def resume_url
        Rails.application.routes.url_helpers.url_for(resume) if resume.attached?
    end

    def applied_time
        self.created_at.strftime("%m %d %Y") 
    end

    def company_name
      self.job.name
    end



  private

  def resume_attached
    errors.add(:resume, 'is required') unless resume.attached?
  end

  def job_presence
    errors.add(:name, 'must choose a job to apply to') unless job_id.present?
  end
end
