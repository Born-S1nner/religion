Rails.application.routes.draw do
  devise_for :users
  resources :peers
  resources :messages

  get 'peers/index'
  get 'messages/public'
  root 'home#home'
end
