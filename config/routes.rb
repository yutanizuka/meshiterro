Rails.application.routes.draw do
  devise_for :users
  root "post_images#index"
  root "post_images#create"
  
  resources :post_images, only: [:new, :create, :index, :show ,:destroy] do #post_imageに下記のテーブルを紐づける
    resource  :favorites,only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
    resources :users,only:[:show,:edit,:update]
end
