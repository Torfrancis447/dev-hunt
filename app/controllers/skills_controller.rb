require 'httparty'

class SkillsController < ApplicationController
    skip_before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid
    
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
        
        skill = get_skills(params[:name])
        skill.create!
        if skill
            render json: skill, status: :ok 
        else
            render json: { errors: ["Invalid skill"] }, status: 404
        end
    end
    
    private
    
    def get_skills params
        
        url = "https://api.apilayer.com/skills?q=#{params}"
        headers = {
        'apikey' => ENV['API_KEY']
        }
        response = HTTParty.get(url, headers: headers)
        skills = JSON.parse(response.body).map.with_index do |skill, index|
            { id: index + 1, name: skill }
        end
        skills
    end

    def skill_params
        params.require(:skill).permit(:name)
    end
    
    def not_valid invalid_skill
        render json: { errors: invalid_skill.record.errors.full_messages }, status: 422
    end
end
