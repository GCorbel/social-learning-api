module Api
  module V1
    class UsersController < Clearance::UsersController
      def index
        render json: User.all
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def create
        render json: { users: User.create(user_params) }
      end

      def update
        user = User.find(params[:id])
        user.update_attributes(user_params)
        render json: { users: user }
      end

      def update_skills
        user = User.find(params[:id])
        user.update_attribute('skill_ids', (params[:skill_ids]))
        render json: { users: user }
      end

      private

      def user_params
        params.require(:user).permit(:nickname, :email, :password,
                                     :password_confirmation)
      end
    end
  end
end
