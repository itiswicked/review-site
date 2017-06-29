Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show] do
    resources :items, only: [:index]
    resources :reviews, only: [:index]
  end
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  namespace :api do
    namespace :v1 do
      resources :reviews do
        member do
          post 'upvote'
          post 'downvote'
        end
      end
    end
  end
end
