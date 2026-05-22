Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  resources :events  # Changed from only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :venues, only: [:index, :show]
end