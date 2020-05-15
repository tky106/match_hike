Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }    
  root "homes#index"
  resources :posts do
    resources :talks, only: [:index, :create, :show]
    member do
      patch 'update_apply'
      get "complete"
    end
  end
end
