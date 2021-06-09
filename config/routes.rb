Rails.application.routes.draw do
  root 'rooms#index'
  get 'search' => 'rooms#search'
  resources :rooms
end
