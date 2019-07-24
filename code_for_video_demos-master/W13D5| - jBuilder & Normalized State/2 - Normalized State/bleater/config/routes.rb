Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "/bleats", to: "bleats#index"

  # get "/bleats/:id", to: "bleats#show"

  # post "/bleats", to: "bleats#create"

  # put "/bleats/:id", to: "bleats#update"

  # delete "/bleats/:id", to: "bleats#destroy"
  resources :bleats

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  get "/get_cookie", to: "cookie_demos#get_cookie"
  get "/set_cookie", to: "cookie_demos#set_cookie"

  namespace :api, defaults: {format: :json} do
    resources :bleats, only: [:index, :create]
  end
end
