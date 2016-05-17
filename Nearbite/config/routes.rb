Rails.application.routes.draw do
  devise_for :users
  resources :reviews do
	resources :comments
  end

  resources :businesses do
    resources :reviews
  end

  resources :locations

  root "businesses#index"
end