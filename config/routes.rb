Rails.application.routes.draw do
  devise_for :users
  root to: 'registers#index'
  resources :registers 
  resources :parent_books do
    resources :teacher_comments 
  end
end
