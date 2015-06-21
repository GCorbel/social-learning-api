module Api
  module V1
    class SkillsController < ::ApplicationController
      respond_to :json

      def index
        render json: { skills: Skill.search(params[:search]) }
      end

      def show
        render json: Skill.find(params[:id])
      end
    end
  end
end
