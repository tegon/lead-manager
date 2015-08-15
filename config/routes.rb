Rails.application.routes.draw do
  root to: 'leads#index'
  get 'auth/:provider/callback' => 'sessions#create'
end