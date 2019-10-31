Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'top_pages#index'

  resources :top_pages
  resources :users, only: [:mypages] do
    member do
      get 'mypages'
      get 'my_post'
      get 'my_favorit'
    end
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :talks, only: [:create, :destroy]
    member do
      get 'details'
    end
  end

end
