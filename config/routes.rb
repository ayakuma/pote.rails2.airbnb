Rails.application.routes.draw do
  devise_for :users
  get "/" => 'room#index'
  
  get "users/index" => "users#index"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id/account" => "users#account"
  post "users/:id/update" => "users#update"
  # get "login" => "users#login_form"
  # post "login" => "device#login"
  # post 'logout'=> 'users#logout'


  resources :users


  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
