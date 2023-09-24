Rails.application.routes.draw do
  get 'users/form' => 'users#form'
  get 'users/calendar' => 'users#calendar'
  get 'users/:id' => 'users#show'
  post 'users/set_duration' => 'users#set_duration'
  get 'render/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'render#index'
  get 'render/show'
  get 'render/form'
  get 'render/calendar'
  get'render/login'
  get 'sessions/login'
end
