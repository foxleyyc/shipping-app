Rails.application.routes.draw do
  root "home#index"
  resources :carriers, only: [:new, :create, :edit, :update]
end
