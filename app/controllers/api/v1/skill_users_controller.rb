module Api
  module V1
    class SkillUsersController < ApplicationController
      def index
        search_params = { kind: params['kind'] }
        search_params[:user_id] = params['user_id'] if params['user_id']
        search_params[:skill_id] = params['skill_id'] if params['skill_id']
        render json: SkillUser.where(search_params)
      end

      def show
        render json: SkillUser.find(params['id'])
      end

      def create
        skill_user = SkillUser.create(skill_user_parans)
        render json: { skill_user: skill_user }
      end

      def update
        skill_user = SkillUser.find(params[:id])
        skill_user.update_attributes(skill_user_parans)
        render json: { skill_user: skill_user }
      end

      def destroy
        skill_user = SkillUser.find(params['id'])
        render json: { skill_user: skill_user.delete }
      end

      private

      def skill_user_parans
        params.require(:skillUser).permit(:user_id, :skill_id,
                                              :description, :kind)
      end
    end
  end
end
