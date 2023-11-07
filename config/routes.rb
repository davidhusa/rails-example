Rails.application.routes.draw do
  root "home#index"
  resources :line_items, only: [:index]
end
