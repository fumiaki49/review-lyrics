Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'top_pages#index'

  resources :top_pages
  resources :users, only: [:mypages] do
    collection do
      get 'mypages'
    end
  end

  resources :posts do
    member do
      get 'details'
    end
  end

end
