Rails.application.routes.draw do
  devise_for :drivers, controllers:{
    sessions: 'drivers/sessions'
  }
  devise_for :users, controllers:{
    sessions: 'users/sessions'
  }
  resources :suppliers
  resources :transportings
  resources :drivings
  resources :admins
  resources :users
  resources :vehicles
  resources :drivers
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "main#index"

  get '/rastreio/:codigo_rastreio', to: 'orders#show_by_codigo_rastreio'

  get '/mark_as_delivered/:id', to:'orders#mark_as_delivered'

  get '/unlink/:id', to:'drivings#unlink'

  get '/driver/:id/orders', to:'drivers#orders'

  get '/driver/:id/orders_history', to:'drivers#orders_history'

  get '/driver/:id/vehicles_history', to:'drivers#vehicles_history'

end
