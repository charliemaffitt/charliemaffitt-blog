Rails.application.routes.draw do
  root 'default#index'
  devise_for :admins

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts, except: [:show]
  end
end
