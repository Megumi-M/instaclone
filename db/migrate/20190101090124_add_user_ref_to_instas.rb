class AddUserRefToInstas < ActiveRecord::Migration[5.1]
  def change
    add_reference :instas, :user, foreign_key: true
  end
end
