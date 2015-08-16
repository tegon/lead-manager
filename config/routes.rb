Rails.application.routes.draw do
  root to: 'sessions#new', as: :login
  get 'auth/salesforce/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  resources :leads
end