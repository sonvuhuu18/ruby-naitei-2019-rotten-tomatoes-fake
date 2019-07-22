Rails.application.routes.draw do
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, except: %i(new create)
  resources :movies
end
