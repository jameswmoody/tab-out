Rails.application.routes.draw do
  root 'twilio#index'
  get '/twilio', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'
end
