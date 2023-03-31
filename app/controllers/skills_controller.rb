require 'httparty'

class SkillsController < ApplicationController
    skip_before_action :authorize
    def index
        render json: Skill.all
    end

    def show
        
        
    end
    def create
        
        job = Job.find_by(id: params[:job_id])
        skill = Skill.create!(skill_params)
        if skill
            render json: skill, status: :created
        else
            render json: { errors: ["Invalid skill"] }, status: 404
        end
        
    end

    def skill_array
        
        skill = get_skills(params[:name]="Developer")
        render json: skill, status: :ok 
    end
    
    private
    
    def get_skills params
        
        url = "https://api.apilayer.com/skills?q=#{params}"
        headers = {
        'apikey' => ENV['API_KEY']
        }
        response = HTTParty.get(url, headers: headers)
        response.body
    end

    def skill_params
        params.require(:skill).permit(:name)
    end
    
end
