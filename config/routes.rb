Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }    
  resources :users, only: [:show] 
  root "homes#index"
  resources :posts do
    resources :talks, only: [:index, :create, :show]
    member do
      patch 'update_apply'
      get "complete"
    end
    collection do 
      get "search"
    end
  end
end
