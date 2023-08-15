class CustomerInquiry < ApplicationRecord
  belongs_to :customer
  belongs_to :shop
  belongs_to :item
  has_many :customer_inquiry_threads, dependent: :destroy

  enum inquiry_status: { unsolved: 0, resolution: 1 }
end
