Rails.application.routes.draw do

  root to: "pages#home"

  resources :users do
     resources :reviews, only: [:show, :index]
  end

  resources :products do
    resources :reviews
  end
end

