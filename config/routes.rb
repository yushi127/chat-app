Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  # root "home#index"
  get 'search' => 'rooms#search'
  resources :rooms
  resources :users
  get 'chatroom' => 'chatroom#show'
  get 'chatroom' => 'chatroom#create'
  mount ActionCable.server => '/cable'
end
