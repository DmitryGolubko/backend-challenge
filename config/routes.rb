Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :orders, except: %i[edit destroy update]
  namespace :orders do
    resource :calculate_total, only: :create
  end
  resources :pizza_types

  root "orders#index"
end
