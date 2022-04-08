Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users
  root "home#index"
end
