class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order_id, :product_id, presence: true

  def subtotal
    quantity * product.price
  end
end
