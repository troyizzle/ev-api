# frozen_string_literal: true

module Api
  module V1
    class PlayersController < ApplicationController
      def index
        players = PrizePicks::Player.all

        render json: PrizePicks::PlayerSerializer.new(players).serializable_hash
      end
    end
  end
end
