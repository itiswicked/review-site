Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show] do
    resources :items, only: [:index, :show, :new, :create]
    resources :reviews, only: [:index, :show, :new, :create]
  end
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index]
  end
end
