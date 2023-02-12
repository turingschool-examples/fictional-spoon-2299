Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ingredients', to: 'ingredients#index'
  get '/recipes/:id', to: 'recipes#show'
end
