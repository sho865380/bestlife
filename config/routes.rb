Rails.application.routes.draw do
  root 'sessions#login'
  post 'sessions/login'=> 'sessions#create' 
  get 'users/form' => 'users#form'
  get 'users/calendar' => 'users#calendar'
  post 'users/set_duration' => 'users#set_duration'
  post 'users/set_duration2' => 'users#set_duration2'
  post 'users/set_duration3' => 'users#set_duration3'

  get 'users/:id' => 'users#show'
  resources :users
  resources :physicals, only: [:create]
end
