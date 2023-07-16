class CreateShopInquiryThreads < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_inquiry_threads do |t|
      t.integer :shop_inquiry_id, null: false
      t.string :speaker_type, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
