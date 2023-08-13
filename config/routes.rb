Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/api/accounts/registration', to: 'api/account#registration'
  post '/api/accounts/validate', to: 'api/account#validate'
  post '/api/accounts/get', to: 'api/account#get'
end
