class ShopInquiry < ApplicationRecord
  belongs_to :shop
  has_many :shop_inquiry_threads, dependent: :destroy

  enum inquiry_status: { resolution: 0, unsolved: 1 }
end
