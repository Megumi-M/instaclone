class RemoveInstaIdFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :insta_id, :integer
  end
end
