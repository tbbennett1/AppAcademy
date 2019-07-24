Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/bleats", to: "bleats#index"

  get "/bleats/:id", to: "bleats#show"
end
