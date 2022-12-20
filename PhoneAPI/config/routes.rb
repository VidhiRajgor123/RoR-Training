Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "phone_number#index"
  get "/phones", to: "phone_number#index"
  post "/phone", to: "phone_number#generate_number"
  post "/phone/:phone", to: "phone_number#generate_number"
end
