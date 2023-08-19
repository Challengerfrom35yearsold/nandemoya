class ShopInquiryThread < ApplicationRecord
  belongs_to :shop_inquiry

  validates :message, presence: true
end
