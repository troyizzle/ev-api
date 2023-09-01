# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :players, only: [:index]
      resources :waitlists, only: [:create]
    end
  end
end
