Rails.application.routes.draw do

  devise_for :users

  get "/" => 'rooms#top'
  get 'rooms/index'
  get "users/index" => "users#index"

  resources :users
  resources :rooms
  resources :posts

  resources :rooms do
    resources :posts
  end 

  get 'post/new' # 入力画面
  post 'post/confirm' # 確認画面
  post 'post/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  post 'post/complete' # 完了画面

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
