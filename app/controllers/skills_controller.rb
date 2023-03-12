class SkillsController < ApplicationController
    skip_before_action :authorize
    def index
        render json: Skill.all
    end
    def show
        
        
    end
    def create
        debugger
        job = Job.find_by(id: params[:job_id])
        skill = Skill.create!(skill_params)
        if skill
            render json: skill, status: :created
        else
            render json: { errors: ["Invalid skill"] }, status: 404
        end
        
    end
    
    private

    def skill_params
        params.require(:skill).permit(:name)
    end
    
end
