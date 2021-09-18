Rails.application.routes.draw do
  resources :moves, only: [:new, :create, :index, :show]
  resources :rooms, only: [:new, :create, :index, :show]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
