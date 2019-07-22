Rails.application.routes.draw do

resources :users
# get '/users', to: 'users#index'
# get '/users/new', to: 'users#new', as: 'new_user'
# get '/users/:id', to: 'users#show', as: 'show_user'
# get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
# post '/users', to: 'users#create'
# put '/users/:id', to: 'users#update'
# delete '/users/:id', to: 'users#destroy'
end
