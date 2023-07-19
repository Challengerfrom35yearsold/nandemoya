class ItemGenre < ApplicationRecord
  has_many :items, dependent: :destroy
end
