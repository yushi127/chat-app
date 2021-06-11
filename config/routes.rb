Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  # root "home#index"
  get 'search' => 'rooms#search'
  resources :rooms
end
