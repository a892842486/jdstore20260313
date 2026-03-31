class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  has_secure_token

  validates :billing_name, :billing_address,
            :shipping_name, :shipping_address,
            presence: true

  def to_param
    token
  end

  def total_price
    product_lists.sum { |item| item.price * item.quantity }
  end

end
