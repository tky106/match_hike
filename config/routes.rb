Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }    
  root "homes#index"
  resources :posts
  resources :posts do
    member do
      patch 'update_apply'
    end
  end
  resources :talks
end
