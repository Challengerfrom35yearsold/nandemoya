class CustomerInquiryThread < ApplicationRecord
  belongs_to :customer_inquiry

  validates :message, presence: true
end
