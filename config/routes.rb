Rails.application.routes.draw do
  devise_for :users
  get "/" => 'room#index'
  
  get "users/index" => "users#index"
  # get "signup" => "users#new"
  get "users/:id" => "users#show"
  get "users/:id/edit"=>"users#edit"

  resources :users

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
