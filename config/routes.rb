Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'top_pages#index'

  resources :top_pages, only: [:indx] do
    member do
      get "index"
    end
  end

end
