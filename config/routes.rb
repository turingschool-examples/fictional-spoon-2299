Rails.application.routes.draw do

	get '/ingredients', to: 'ingredients#index'
	get '/recipes/:id', to: 'recipes#show'
	patch '/recipes/:id', to: 'recipes#update'
end
