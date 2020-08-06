Rails.application.routes.draw do
  devise_for :users
  resources :item, only: [:new, :create]
end
