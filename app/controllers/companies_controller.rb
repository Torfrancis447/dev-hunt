class CompaniesController < ApplicationController
    skip_before_action :authorize
    def all_companies
        render json: Company.all, status: :ok
    end

    def add_new_company
        company = Company.create!(company_params)
    end

    private
    
    def company_params
        params.require(:company).permit(:name, :headquarters)
    end
end
