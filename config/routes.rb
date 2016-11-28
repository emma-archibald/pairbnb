Rails.application.routes.draw do

  resources :listings do
    resources :reservations
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :reservations
  end 


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root 'welcome#index'

end
