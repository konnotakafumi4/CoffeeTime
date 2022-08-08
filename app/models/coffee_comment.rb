class CoffeeComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :coffee
end
