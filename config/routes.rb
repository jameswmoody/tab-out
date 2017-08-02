Rails.application.routes.draw do
  root 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/cards/new', to: 'cards#new'
  post '/cards/new', to: 'cards#create'
  get '/cards/edit', to: 'cards#edit'
  patch '/cards/update', to: 'cards#update'

  post '/twilio', to: 'twilio#text'

  resources :customers, except: [:index]

  resources :tabs do
    resources :items, only: [:create, :show, :destroy]
  end

  resources :businesses, only: [:show]

  get '/tabs/:id/checkout', to: 'tabs#checkout', as: 'checkout_tab'
  post '/tabs/:id/close', to: 'tabs#close', as: 'close_tab'
end
