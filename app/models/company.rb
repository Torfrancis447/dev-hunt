class Company < ApplicationRecord
    has_many :jobs
    has_many :job_applications, through: :jobs
    has_many :employees
    
    
end
