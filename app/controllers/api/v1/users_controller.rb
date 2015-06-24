module Api
  module V1
    class UsersController < Clearance::UsersController
      def index
        render json: { users: User.all }
      end

      def show
        render json: { users: User.find(params[:id]) }
      end

      def create
        render json: { users: User.create(user_params) }
      end

      private

      def user_params
        params.require(:user).permit(:nickname, :email, :password,
                                     :password_confirmation)
      end
    end
  end
end
