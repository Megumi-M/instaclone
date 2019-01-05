class CreateInstas < ActiveRecord::Migration[5.1]
  def change
    create_table :instas do |t|
      t.text :content
      t.string :image
    end
  end
end
