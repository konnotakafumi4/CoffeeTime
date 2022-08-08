class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coffees
  has_many :favorites, dependent: :destroy
  has_many :coffee_comments, dependent: :destroy
  has_one_attached :end_user_image

  def get_profile_image(width, height)
    unless end_user_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     end_user_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    end
     end_user_image.variant(resize_to_limit: [width, height]).processed
  end

end
