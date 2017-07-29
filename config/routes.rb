Rails.application.routes.draw do

  root 'pages#index'

  resources :customers, only: [:new, :create]

  get '/cards/new', to: 'cards#new'
  post '/cards/new', to: 'cards#create'

  get  '/twilio', to: 'twilio#index'
  get '/twilio/text', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'
end
