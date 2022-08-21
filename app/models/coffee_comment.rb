class CoffeeComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :coffee

  has_many_attached :images

  def get_comment_image(width, height)
    #unless images.attached?
     #file_path = Rails.root.join('app/assets/images/no_image.jpg')
     #images.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    #end
     images.map { |image| image.variant(resize_to_limit: [width, height]).processed }
  end
end
