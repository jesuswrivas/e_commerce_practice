Rails.application.routes.draw do

  root to: 'pages#home'



  # routes for Pages Controller
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/home", to: "pages#home"
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
      get "/settings", to: "profiles#settings"

      resources :purchases, only: [:new, :create, :index]
  end


  #routes for Cart Controller
  resource :cart, only: [:show]  do
    resources :cart_items, only: [:new, :create, :index, :destroy]
  end


  resources :products do
    resources :reviews, only:[:show, :index]
  end

  resources :categories, only: [:show] do
    resources :products, only: [:index]
  end



  resources :purchase_products, only: [:show, :index] do
    resources :reviews, only:[:new, :create, :edit]
  end


  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
    end
  end

end

