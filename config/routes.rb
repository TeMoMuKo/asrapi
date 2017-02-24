Rails.application.routes.draw do

  apipie
  root "application#index"

  devise_for :users, controllers: {
    confirmations: 'confirmations',
    passwords: 'passwords',
    registrations: 'registrations'
  }
  devise_scope :user do
    patch "/confirm" => "confirmations#confirm"
  end

  namespace :api, defaults: { format: :json } do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: "sessions",
        token_validations: "token_validations"
      }
    end

    namespace :v2 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: "sessions",
        token_validations: "token_validations"
      }
      resources :teams, only: [:index, :show] do
        resources :locations, shallow: true, only: [:index, :show]
      end
      post "/locations", to: "locations#create"
    end
  end

  resources :teams, defaults: { format: :json }, only: [:index, :show] do
    resources :locations, defaults: { format: :json }, shallow: true, only: [:index, :show]
  end
  post "/locations", to: "locations#create"
end
