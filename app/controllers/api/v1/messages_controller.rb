module Api
  module V1
    class MessagesController < ApplicationController
      def show
        render json: Message.find(params[:id])
      end

      def create
        message = Message.create(message_params)
        render json: message
      end

      private

      def message_params
        params.require(:message).permit(:body, :trail_id)
      end
    end
  end
end
