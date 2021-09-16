Rails.application.routes.draw do
  resources :moves
  resources :rooms
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  root to: 'home#index'
  get '/users', to: 'users#index'

  resources :users do
    collection do
      delete 'destroy_multiple'
      patch 'batch_operation'
    end
  end

  resources :rock_games

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
