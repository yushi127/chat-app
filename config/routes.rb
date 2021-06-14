Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  get 'search' => 'rooms#search'
  # get 'myroom' => 'myrooms#index'
  # delete 'myrooms/:id' => 'myrooms#destroy'
  # delete 'relationdes' => 'rooms#relationdes'
  # delete 'room/:id', to: 'rooms#relationdes'
  resources :myrooms
  resources :rooms
end
