Rails.application.routes.draw do

  root 'pages#index'

  get  '/twilio', to: 'twilio#index'
  get '/twilio/text', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'
end
