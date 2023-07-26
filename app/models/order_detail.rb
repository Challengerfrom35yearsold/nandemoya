class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum shipping_status: { waiting_for_payment: 0, shipping_preparation: 1, sent: 2 }
end
