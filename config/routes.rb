Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  # root "home#index"
  get 'search' => 'rooms#search'
  get 'setting' => 'rooms#setting'
  resources :myrooms
  resources :rooms
  resources :users
  resources :chatroom
  # get 'chatroom' => 'chatroom#show'
  # get 'chatroom' => 'chatroom#create'
  mount ActionCable.server => '/cable'
end



