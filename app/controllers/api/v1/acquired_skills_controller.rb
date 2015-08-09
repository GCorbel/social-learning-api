module Api
  module V1
    class AcquiredSkillsController < ApplicationController
      def index
        render json: AcquiredSkill.where(user_id: params['user_id'])
      end

      def create
        acquired_skill = AcquiredSkill.create(acquired_skill_parans)
        render json: { acquired_skill: acquired_skill }
      end

      def update
        acquired_skill = AcquiredSkill.find(params[:id])
        acquired_skill.update_attributes(acquired_skill_parans)
        render json: { acquired_skill: acquired_skill }
      end

      def destroy
        acquired_skill = AcquiredSkill.find(params[:id])
        render json: { acquired_skill: acquired_skill.delete }
      end

      private

      def acquired_skill_parans
        params.require(:acquiredSkill).permit(:user_id, :skill_id, :description)
      end
    end
  end
end
