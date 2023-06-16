Rails.application.routes.draw do

  root to: 'pages#home'



  # routes for Pages Controller
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/home", to: "pages#home"
  get "/products", to: "pages#products"
  get "/log_in", to: "pages#log_in"

  #Routes for Sessions controller
  resources :sessions, only: [:new, :create]
  delete "/log_out", to: "sessions#destroy", as: :log_out


  resources :users do
     resources :reviews, only: [:show, :index]
      #routes for Profiles Controller
      get "/profile", to: "profiles#profile"
      get "/addresses", to: "profiles#addresses"
      get "/cards", to: "profiles#cards"
      get "/personal_info", to: "profiles#personal_info"
      get "/security", to: "profiles#security"
  end

  resources :products do
    resources :reviews
  end
end

