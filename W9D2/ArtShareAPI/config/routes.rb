Rails.application.routes.draw do

resources :users, except: [:edit, :new] do
  resources :artworks
end
# get '/users', to: 'users#index'
# get '/users/new', to: 'users#new', as: 'new_user'
# get '/users/:id', to: 'users#show', as: 'show_user'
# get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
# post '/users', to: 'users#create'
# put '/users/:id', to: 'users#update'
# delete '/users/:id', to: 'users#destroy'

resources :artworks, except: [:edit, :new, :index]
# get '/artworks', to: 'artworks#index'
# get '/artworks/new', to: 'artworks#new', as: 'new_artwork'
# get '/artworks/:id', to: 'artworks#show', as: 'show_artwork'
# get '/artworks/:id/edit', to: 'artworks#edit', as: 'edit_artwork'
# post '/artworks', to: 'artworks#create'
# put '/artworks/:id', to: 'artworks#update'
# delete '/artworks/:id', to: 'artworks#destroy'

resources :artwork_shares, only: [:create, :destroy]

resources :comments, only: [:create, :destroy, :index]

# resources :likes, only: [:create, :destroy, :index]

  resources :collections, only: [:create, :destroy, :show] do
    resources :artworks, only: [:index] do
      post :add, to: 'collections#add_artwork', as: 'add'
      delete :remove, to: 'collections#remove_artwork', as: 'remove'
    end
  end
end
