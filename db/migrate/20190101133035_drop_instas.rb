class DropInstas < ActiveRecord::Migration[5.1]
  def change
    drop_table :instas
  end
end
