Rails.application.routes.draw do

  get '/ingredients', to: 'ingredients#index'

  get '/recipes/:id', to: 'recipes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
