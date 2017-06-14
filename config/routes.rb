Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show] do
    resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:show]
  end
  resources :items, only: [:index, :show, :edit, :destroy] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
