Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  get '/ingredients', to: 'ingredients#index'
  get '/recipes/:id', to: 'recipes#show'
  # get '/hotels/new', to: 'hotels#new' #takes us to the HTML page where we have the form, and once you fill out the form, it sends the POST request <form action="/hotels" method="post">. It sends to POST 
  # get '/hotels/:id', to: 'hotels#show'
  # get '/guests', to: 'guests#index'
end
