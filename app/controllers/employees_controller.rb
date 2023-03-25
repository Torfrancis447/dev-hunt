class EmployeesController < ApplicationController
    skip_before_action :authorize
    def employee_applications
        
        employee = Employee.find_by(user_id: params[:id])
        if employee
            render json: employee.job_applications, status: :ok
        else
            render josn: {errors: ['Employee not found']}, status: 401
        end        
    end

    



end
