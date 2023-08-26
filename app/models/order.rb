class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  attr_accessor :address_btn
  attr_accessor :address_id

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_payment, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
end