class CreateFavoriteShops < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_shops do |t|
      t.integer :customer_id, null: false
      t.integer :shop_id, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
