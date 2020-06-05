Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }    
  resources :users, only: :show do 
    member do
      get "list"
    end
  end
  root "homes#index"
  resources :posts do
    resources :talks, only: [:index, :create, :show]
    namespace :api do
      resources :talks, only: [:index], defaults: { format: 'json' }
    end  
    member do
      patch 'update_apply'
      get "complete"
    end
    collection do 
      get "search"
    end
  end
end
