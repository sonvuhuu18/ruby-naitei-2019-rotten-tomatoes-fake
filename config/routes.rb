Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root "static_pages#home"
  resources :movies, only: %i(index show)
  namespace :admin do
    resources :movies
    resources :users, except: %i(new create)
    resources :tv_shows
    root "dashboard#index"
  end
  resources :movies
  resources :users, except: %i(new create)
  resources :tv_shows
  resources :celebrities
end
