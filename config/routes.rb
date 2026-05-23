Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  resources :events
  resources :users, only: [:index, :show]
  resources :categories  # los cambie para incluir todos
  resources :venues      # los cambie para incluir todos
end