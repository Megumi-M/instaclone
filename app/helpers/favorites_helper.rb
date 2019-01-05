module FavoritesHelper
  def create
    favorite = current_user.favorites.create(insta_id: params[:insta_id])
    redirect_to instas_url, notice: "#{favorite.insta.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to instas_url, notice: "#{favorite.insta.user.name}さんのブログをお気に入り解除しました"
  end
end
