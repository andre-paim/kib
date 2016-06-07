Rails.application.routes.draw do

  root 'pages#home'

  resources :courses
  resources :matches
  resources :students
  resources :teachers

  resources :users
  resources :sessions
  
  get '/how-it-works' => 'pages#how-it-works'
  get '/calendar' => 'pages#calendar'
  # get '/about' => 'pages#about'

end
