Rails.application.routes.draw do

  devise_for :users

  root to:'rooms#top'
  get 'rooms/index'
  get "users/index" => "users#index"
  post "rooms/:id/posts/confirm" => "posts#confirm"
  get "rooms/:id/hostprof" => "rooms#hostprof"
  get "rooms/myroom" => "rooms#myroom"

  resources :users
  resources :rooms
  resources :posts

  resources :rooms do
    resources :posts
  end 

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
