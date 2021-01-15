Rails.application.routes.draw do
  get "/" => 'room#index'
  
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  get "users/:id/destroy" => "users#destory"
  get "users/:id/account" => "users#account"
  post "users/:id/update" => "users#update"




  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
