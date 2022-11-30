Rails.application.routes.draw do
  devise_for :users
  root to: 'registers#index'
  resources :registers, only: [:index, :new, :create]
end
