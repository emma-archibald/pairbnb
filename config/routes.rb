Rails.application.routes.draw do

  resources :listings do
    resources :reservations
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :reservations
  end

  resources :payments, only: [:new, :create]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get 'payments/client_token'

  root 'welcome#index'

end
