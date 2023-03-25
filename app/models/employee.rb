class Employee < ApplicationRecord
    belongs_to :user
    belongs_to :company
    
    def applications
        self.company.job_applications
    end
    
    
end
