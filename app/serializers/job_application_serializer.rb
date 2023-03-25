class JobApplicationSerializer < ActiveModel::Serializer
  attributes :id, :applied_time, :resume_url, :job_title, :company_name, :compensation, :compensation_type, :location, :location_type, :employment_type, :name, :email, :avaliability, :sponsorship, :work_authorization

  def job_title
    object.job.title
  end
  
  def company_name
    object.job.company.name
  end

  def job_title
    object.job.title
  end

  def compensation
    object.job.compensation
  end

  def location_type
    object.job.location_type
  end

  def employment_type
    object.job.employment_type
  end

  def location
    object.job.location
  end

  def compensation_type
    object.job.compensation_type
  end

  def name
    object.user.name
  end

  def email
    object.user.email
  end
end
