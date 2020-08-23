Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
   resources :transactions, only: [:index, :create]
  end
  resources :users, only: [:new, :create]
 

end
