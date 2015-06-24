module Api
  module V1
    class SkillsController < ::ApplicationController
      def index
        render json: { skills: Skill.search(params[:search]) }
      end

      def show
        render json: { skill: { id: 2, name: 'Rails', description: 'test', users: [2] }, users: User.all }
      end
    end
  end
end
