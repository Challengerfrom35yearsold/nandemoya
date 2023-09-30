class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :number_of_stars, presence: true
  validates :title, presence: true
  validates :review_content, presence: true

end
