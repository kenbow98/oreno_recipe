class Recipe < ApplicationRecord
  belongs_to :customer
  has_many :ingredients, dependent: :destroy
  has_many :cooking_process, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :cooking_process
  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io:File.open(file_path), filename:'default-image.jpeg', content_type: 'image/jpeg')
    end
    image
  end

end
