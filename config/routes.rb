Rails.application.routes.draw do

  resources :listings

  resources :users, only: [:show, :edit, :update, :destroy]
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root 'welcome#index'

end
