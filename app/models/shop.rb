class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_one_attached :image
  has_many_attached :images
  belongs_to :shop_genre
  has_many :items, dependent: :destroy
  has_many :customer_inquiries, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy

  validates :shop_name, presence: true
  validates :shop_name_kana, presence: true
  validates :shop_genre_id, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :free_space, presence: true
  validates :shipping_carrier, presence: true
  validates :about_shipping, presence: true
  validates :personal_information, presence: true
  validates :settlement, presence: true
  validates :inquiry, presence: true
  validates :rogo_arrangement_btn, presence: true
  validates :introduction_arrangement_btn, presence: true

  def self.shop_genre_name_looks(word)
    where("shop_genre_id LIKE ?", "#{word}")
  end

  FILE_NUMBER_LIMIT = 3
  validate :validate_number_of_files

  def get_shop_images(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images.map {|image| image.variant(resize_to_limit: [width, height]).processed}
  end

  def get_shop_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  private

  def validate_number_of_files
    return if images.length <= FILE_NUMBER_LIMIT
    errors.add(:images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
