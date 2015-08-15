module Api
  module V1
    class SessionsController < Clearance::SessionsController
      def create
        user = authenticate(params)
        if user.present?
          sign_in(user)
          token = Digest::SHA1.hexdigest([Time.now, rand].join)
          render json: { token: token, user_id: user.id }
        else
          render json: { errors: { messages: ['Invalid authentication'] } },
            status: :unprocessable_entity
        end
      end

      def destroy
        sign_out
      end
    end
  end
end
