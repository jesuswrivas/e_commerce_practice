Rails.application.routes.draw do

  resources :users do
     resources :reviews, only: [:show, :index]
  end

  resources :products do
    resources :reviews
  end
end

