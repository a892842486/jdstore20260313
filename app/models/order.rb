class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  before_create :generate_token

  validates :billing_name, :billing_address,
            :shipping_name, :shipping_address,
            presence: true

  private

  def generate_token
    self.token ||= SecureRandom.uuid
  end
end
