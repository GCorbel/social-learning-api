module Api
  module V1
    class SessionsController < Clearance::SessionsController
      def create
        user = authenticate(params)
        sign_in(user)
        token = Digest::SHA1.hexdigest([Time.now, rand].join)
        render json: { token: token }
      end

      def destroy
        sign_out
      end
    end
  end
end
