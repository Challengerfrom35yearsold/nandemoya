class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :item_genre
  has_many :review, dependent: :destroy

  def with_tax_price
    (price*1.1).floor
  end

  def self.item_name_looks(word)
    where("name LIKE ?", "%#{word}%")
  end

  def self.item_genre_name_looks(word)
    where("item_genre_id LIKE ?", "#{word}")
  end


  def get_item_images(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images.map {|image| image.variant(resize_to_limit: [width, height]).processed}
  end

  def get_item_image(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images[0].variant(resize_to_limit: [width, height]).processed
  end
end
