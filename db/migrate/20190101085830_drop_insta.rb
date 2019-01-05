class DropInsta < ActiveRecord::Migration[5.1]
  def change
    drop_table :insta
  end
end
