Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations'
  }
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  get 'users/login' => 'users#login'
  resources :users, only: [:new, :show]
end
