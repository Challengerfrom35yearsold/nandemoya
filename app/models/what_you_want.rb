class WhatYouWant < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one :shop, through: :item
end
