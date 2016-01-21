Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :teams, only: [:index, :show] do
    resources :locations, shallow: true, only: [:index, :show, :create]
  end
end
