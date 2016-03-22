Rails.application.routes.draw do
  root 'default#index'

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts, except: [:show]
  end
end
