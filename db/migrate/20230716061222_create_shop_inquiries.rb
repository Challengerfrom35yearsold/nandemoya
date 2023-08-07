class CreateShopInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_inquiries do |t|
      t.integer :shop_id, null: false
      t.string :title, null: false
      t.text :inquiry, null: false
      t.integer :inquiry_status, default: 0, null: false

      t.timestamps
    end
  end
end
