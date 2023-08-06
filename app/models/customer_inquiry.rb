class CustomerInquiry < ApplicationRecord
  belongs_to :customer
  belongs_to :shop
  has_many :customer_inquiry_threads, dependent: :destroy

  enum inquiry_status: { not_compatible: 0, answered: 1, close: 2 }
end
