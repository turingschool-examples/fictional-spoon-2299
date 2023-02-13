Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ingredients', to: 'ingredients#index'
  get '/ingredients/new', to: 'ingredients#new'
  # get '/ingredients/:id', to: 'ingredients#show'

  get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new'
  get '/recipes/:id', to: 'recipes#show'
end

