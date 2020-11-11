Rails.application.routes.draw do
  devise_for :users, controllers:{ 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root  'home#index'

  resources :home, only:[:index] do
    collection do
      get 'chat', 'game', 'seek'
    end
  end
  resources :tweets do
    member do
      get 'discussion'
    end
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end

  resources :users,  only:[:index, :show] do
    collection do
      get 'follow_team', 'follow_prefecture'
    end
  end
  resources :reactions, only:[:create]
  resources :matching, only:[:index]
  resources :chat, only:[:create] 
  resources :notifications, only: [:index]
  resources :message, only:[:show, :create]
end
