class Coffee < ApplicationRecord
  belongs_to :end_user
  has_many :coffee_comments, dependent: :destroy

  has_one_attached :image

  def get_profile_image(width, height)
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    end
     image.variant(resize_to_limit: [width, height]).processed
  end

  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
     favorites.exists?(end_user_id: end_user.id)
  end
end
