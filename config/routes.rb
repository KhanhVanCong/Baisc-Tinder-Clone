Rails.application.routes.draw do
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users do
    member do
      get :liked_the_other, :likers
    end
  end
  resources :relationship_likes, only: [:create, :destroy]
  root "home#index"
end
