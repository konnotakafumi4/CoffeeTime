class Coffee < ApplicationRecord
  belongs_to :end_user
  has_many :coffee_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :images

  def get_profile_image(width, height)
    unless images.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     images.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    end
     images.map { |image| image.variant(resize_to_limit: [width, height]).processed }
  end

  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
     favorites.exists?(end_user_id: end_user.id)
  end

  def self.looks(word)
    @coffee = Coffee.where("text LIKE?","%#{word}%")
  end
end
