Rails.application.routes.draw do
get 'users/form' => 'users#form'
get 'users/calendar' => 'users#calendar'
post 'users/set_duration' => 'users#set_duration'
post 'users/set_duration2' => 'users#set_duration2'


# このルーティングは最後に定義します
get 'users/:id' => 'users#show'
resources :users
  
  get 'render/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'render#index'
  get 'render/show'
  get 'render/form'
  get 'render/calendar'
  get'render/login'
  get 'sessions/login'=> 'sessions#login'
  post 'sessions/login'=> 'sessions#create' 
end
