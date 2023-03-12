class JobSerializer < ActiveModel::Serializer
  attributes :id, :description, :compensation_type, :compensation, :location_type, :employment_type, :location, :title, :created_at, :posted_time, :application_count

  has_many :skills
  belongs_to :company
  has_many :job_applications
end
