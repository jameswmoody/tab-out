Rails.application.routes.draw do
  root 'pages#index'

  resources :customers, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Payment Method on Signup Routes
  get '/cards/new', to: 'cards#new'
  post '/cards/new', to: 'cards#create'

  post '/twilio', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'

  resources :customers

  resources :tabs do
    resources :items
  end

  resources :businesses, only: [:show]

  get '/tabs/:id/checkout', to: 'tabs#checkout', as: 'checkout_tab'
  post '/tabs/:id/close', to: 'tabs#close', as: 'close_tab'
end
