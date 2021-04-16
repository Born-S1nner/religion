Rails.application.routes.draw do
  devise_for :users
  resources :peers
  resources :messages

  get 'messages/index'
  get 'peers/index'
  root 'home#home'
end
