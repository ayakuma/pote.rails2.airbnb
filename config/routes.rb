Rails.application.routes.draw do

  devise_for :users

  get "/" => 'rooms#top'
  get 'rooms/index'
  get "users/index" => "users#index"
  post "rooms/:id/posts/confirm" => "rooms#confirm"

  resources :users
  resources :rooms
  resources :posts

  resources :rooms do
    resources :posts
  end 

  get 'posts/new' # 入力画面
  # post 'posts/confirm' # 確認画面
  post 'posts/back' # 確認画面から「入力画面に戻る」をクリックしたとき

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
