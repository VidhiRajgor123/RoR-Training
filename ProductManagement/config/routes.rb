Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  resources :products
  get '/carts', to: 'carts#index'
  get '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  delete '/carts/:id' => 'carts#destroy'
  post '/orders', to: 'orders#create'
  get '/history', to: 'orders#history'
  get '/orders/:id' => 'orders#order_detail'
end

