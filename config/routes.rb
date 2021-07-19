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

# Rails.application.routes.draw do
#   devise_for :users
#   root 'rooms#index'
#   get 'search' => 'rooms#search'
#   get 'setting' => 'rooms#setting'

#   # get 'myroom' => 'myrooms#index'
#   # delete 'myrooms/:id' => 'myrooms#destroy'
#   # delete 'relationdes' => 'rooms#relationdes'
#   # delete 'room/:id', to: 'rooms#relationdes'
#   resources :myrooms
#   resources :rooms
# end
