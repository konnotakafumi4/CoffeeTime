class Coffee < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  def get_profile_image(width, height)
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    end
     image.variant(resize_to_limit: [width, height]).processed
  end
end
