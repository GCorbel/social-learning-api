module Api
  module V1
    class SkillsController < ::ApplicationController
      def index
        render json: { skills: Skill.search(params[:search]) }
      end

      def show
        render json: { skills: Skill.find(params[:id]) }
      end
    end
  end
end
