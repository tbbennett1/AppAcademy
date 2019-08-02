Rails.application.routes.draw do
  resources :users
  resources :subs do
    resources :posts
  end
  resources :posts, only: [:destroy]
  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
