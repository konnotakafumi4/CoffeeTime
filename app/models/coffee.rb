class Coffee < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
end
