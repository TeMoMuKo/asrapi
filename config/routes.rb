Rails.application.routes.draw do

  devise_for :users, :controllers => {:confirmations => 'confirmations'}
  devise_scope :user do
    patch "/confirm" => "confirmations#confirm"
  end

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  resources :teams, only: [:index, :show] do
    resources :locations, shallow: true, only: [:index, :show]
  end
  post "/locations", to: "locations#create"
end
