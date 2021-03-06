Rails.application.routes.draw do
  
  get 'exits/index'
  devise_for :users
  root 'places#index'
  
  resources :places, only: [:show] do
    resources :favorites, only: [:create, :destroy]
    collection do
      get :search
      get :destination
      get :exit
    end
  end
  
  namespace :admin do
    resources :places do
      collection do
        get :destination
      end
    end
  end
  
  resources :users, only: [:show]
  resources :exits, only: [:index, :show]

end
