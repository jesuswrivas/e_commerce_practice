Rails.application.routes.draw do

  root to: 'pages#home'

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/home", to: "pages#home"
  get "/products", to: "pages#products"
  get "/profile", to: "pages#profile"

  resources :users do
     resources :reviews, only: [:show, :index]
  end

  resources :products do
    resources :reviews
  end
end

