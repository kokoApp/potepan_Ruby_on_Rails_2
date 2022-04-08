class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.date :start
      t.date :end
      t.integer :pepole
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
