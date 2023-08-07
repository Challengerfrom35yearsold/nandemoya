class CreateCustomerInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_inquiries do |t|
      t.integer :customer_id, null: false
      t.integer :shop_id, null: false
      t.integer :item_id, null: false
      t.string :title, null: false
      t.text :inquiry, null: false
      t.integer :inquiry_status, default: 0, null: false

      t.timestamps
    end
  end
end
