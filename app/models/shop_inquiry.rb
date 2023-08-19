class ShopInquiry < ApplicationRecord
  belongs_to :shop
  has_many :shop_inquiry_threads, dependent: :destroy

  validates :title, presence: true
  validates :inquiry, presence: true

  enum inquiry_status: { unsolved: 0, resolution: 1 }
end
