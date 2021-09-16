Rails.application.routes.draw do
  # get 'users/expulsion'
  devise_for :users
  root 'rooms#index'
  # root "home#index"
  get 'myrooms/search' => 'myrooms#search', as: :myroomsearch
  get 'search' => 'rooms#search'
  get 'setting' => 'rooms#setting'
  get 'users/:id/show' => 'users#show' , as: :userexplusion
  put 'users/explusion' => 'users#explusion'
  delete 'users/:id' => 'users#destroy', as: :del_userexplusion
  # post 'message/:id' => 'message#create' , as: :

  resources :myrooms
  resources :rooms do
    resources :messages
  end
  resources :users 
  # get 'chatroom' => 'chatroom#show'
  # get 'chatroom' => 'chatroom#create'
  mount ActionCable.server => '/cable'
end



