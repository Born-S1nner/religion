Rails.application.routes.draw do
  resources :messages
  devise_for :users
  resources :peers

  get 'peers/index'
  root 'home#home'
end
