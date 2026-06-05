Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  root to: "home#index"

  resources :events do
    member do
      patch :publish
      patch :cancel
    end
    resources :registrations, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show]
  resources :categories
  resources :venues
end