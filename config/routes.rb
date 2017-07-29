Rails.application.routes.draw do
  root 'pages#index'

  resources :customers, only: [:new, :create]

  # Customer Login Routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # Businesses Login Routes
  get '/businesses/login', to: 'sessions#new'
  post '/businesses/login', to: 'sessions#create'
  # Logout
  get '/logout', to: 'sessions#destroy'

  # Payment Method on Signup Routes
  get '/cards/new', to: 'cards#new'
  post '/cards/new', to: 'cards#create'

  get  '/twilio', to: 'twilio#index'
  get '/twilio/text', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'
end
