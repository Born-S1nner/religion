Rails.application.routes.draw do
  devise_for :users
  resources :peers

  get 'peers/index'
  root 'home#home'
end
