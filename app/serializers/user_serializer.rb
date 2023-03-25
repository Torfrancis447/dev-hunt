class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image_url, :jobs_applied_to, :count_created_within_month, :is_employer, :employee_data, :name, :uncreated_jobs
  has_many :job_applications
  
end
