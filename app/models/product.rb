class Product < ApplicationRecord
  has_one_attached :image

  # 縮圖版本
  def thumbnail
    image.variant(resize_to_limit: [ 150, 150 ])
  end

  def medium
    image.variant(resize_to_limit: [ 300, 300 ])
  end

  def large
    image.variant(resize_to_limit: [ 600, 600 ])
  end
end
