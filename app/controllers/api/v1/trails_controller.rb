module Api
  module V1
    class TrailsController < ApplicationController
      def show
        render json: Trail.find(params[:id])
      end

      def create
        render json: { trail: Trail.create(trail_params) }
      end

      def update
        trail = Trail.find(params[:id])
        render json: trail.update_attributes(trail_params)
      end

      private

      def trail_params
        params.require(:trail).permit(:user_ids)
      end
    end
  end
end
