Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/accounts/:id', to: 'api/account#get'
  post '/api/accounts/create', to: 'api/account#create'
end
