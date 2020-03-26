Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  root 'users#welcome'
  get '/signin' => 'sessions#login'
  post '/signin' => 'sessions#signin'
  post '/logout' => 'sessions#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
