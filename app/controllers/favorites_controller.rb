class FavoritesController < ApplicationController
  before_action :check_user, only: [:index]
  def index
    @favorites_pictures = current_user.favorite_pictures
  end
  
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの投稿をお気に入り解除しました"
  end
end

private

  def check_user
    unless logged_in?
      redirect_to new_session_path
    end
  end
