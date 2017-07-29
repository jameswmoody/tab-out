Rails.application.routes.draw do

  root 'pages#index'

  get  '/twilio', to: 'twilio#index'
  get '/twilio/text', to: 'twilio#text'

  get '/transactions/new', to: 'transactions#new'
  post '/transactions/new', to: 'transactions#create'

  resources :customers
  resources :tabs
  get '/tabs/:id/checkout', to: 'tabs#checkout', as: 'checkout_tab'
  post '/tabs/:id/close', to: 'tabs#close', as: 'close_tab'


end
