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
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: { users: user }
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def matches
        users = UserMatcher.new(user: User.find(params[:id])).call
        render json: { users: users }
      end

      private

      def user_params
        params.require(:user).permit(:nickname, :email, :password,
                                     :password_confirmation)
      end
    end
  end
end
