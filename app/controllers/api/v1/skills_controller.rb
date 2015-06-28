module Api
  module V1
    class SkillsController < ::ApplicationController
      def index
        render json: { skills: Skill.search(params[:search]) }
      end

      def show
        skill = Skill.find(params[:id])
        render json: skill
      end
    end
  end
end
