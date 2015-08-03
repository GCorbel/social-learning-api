module Api
  module V1
    class SearchedSkillsController < ApplicationController
      def index
        render json: SearchedSkill.all
      end

      def create
        searched_skill = SearchedSkill.create(searched_skill_parans)
        render json: { searched_skill: searched_skill }
      end

      def destroy
        searched_skill = SearchedSkill.find(params[:id])
        render json: { searched_skill: searched_skill.delete }
      end

      private

      def searched_skill_parans
        params.require(:searchedSkill).permit(:user_id, :skill_id, :description)
      end
    end
  end
end
