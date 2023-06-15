Rails.application.routes.draw do

  root to: 'pages#home'

  # routes for Pages Controller
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/home", to: "pages#home"
  get "/products", to: "pages#products"
  get "/profile", to: "pages#profile"
  get "/log_in", to: "pages#log_in"

  #Routes for Sessions controller
  resources :sessions, only: [:new, :create]
  delete "/log_out", to: "sessions#destroy", as: :log_out


  resources :users do
     resources :reviews, only: [:show, :index]
  end

  resources :products do
    resources :reviews
  end
end

