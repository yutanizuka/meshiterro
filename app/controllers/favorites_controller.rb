class FavoritesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id]) #インスタンスにidを設定
    favorite = current_user.favorites.new(post_image_id: post_image.id) #favoriteにidを設定
    favorite.save #dbに保存
    redirect_to post_image_path(post_image) #image_path 詳細に戻る
  end
  def destroy
    post_image = PostImage.find(params[:post_image_id]) #インスタンスにidを設定
    favorite = current_user.favorites.find_by(post_image_id: post_image.id) 
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
