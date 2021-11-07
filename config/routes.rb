Rails.application.routes.draw do
  scope :api, default: { format: :json } do
    namespace :v1 do
      resources :stocks, only: %i[index create update]
      resources :bearers, only: %i[index create]
    end
  end
end
