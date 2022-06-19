class Recipe < ApplicationRecord
  belongs_to :customer
  has_many :ingredients, dependent: :destroy
  has_many :cooking_process, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :cooking_process
  has_one_attached :image
end
