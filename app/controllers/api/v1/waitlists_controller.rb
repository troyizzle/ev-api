module Api
  module V1
    # Used to create waitlists
    class WaitlistsController < ApplicationController
      def create
        waitlist = Waitlist.new(waitlist_params)

        if waitlist.save
          render json: { status: 'SUCCESS', message: 'Waitlist created', data: waitlist }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Waitlist not created', data: waitlist.errors }, status: :unprocessable_entity
        end
      end

      private

      def waitlist_params
        params.require(:waitlist).permit(:email)
      end
    end
  end
end
