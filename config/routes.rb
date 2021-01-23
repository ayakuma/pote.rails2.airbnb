Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/show'
  get 'rooms/edit'
  devise_for :users
  get "/" => 'rooms#top'

  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/edit"=>"users#edit"

  get "rooms/new" => "rooms#new"

  resources :users
  resources :rooms

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
