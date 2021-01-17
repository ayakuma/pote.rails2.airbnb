Rails.application.routes.draw do
  get "/" => 'room#index'
  
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id/account" => "users#account"
  post "users/:id/update" => "users#update"


  resources :users



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
