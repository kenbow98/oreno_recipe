class CookingProcess < ApplicationRecord
  
  has_one_attached :image
  belongs_to :recipe
end
