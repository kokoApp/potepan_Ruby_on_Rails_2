class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :hotel
      t.string :place
      t.string :explantion
      t.integer :price
      t.string :image_id
      t.integer :user_id
      t.timestamps
    end
  end
end
