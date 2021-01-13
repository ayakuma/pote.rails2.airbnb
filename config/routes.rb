Rails.application.routes.draw do
  get "/" => 'room#index'





  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/edit" => "users/edit"
  




  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
