class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def total
    sum = 0
    self.order_items.each do |i|
      sum += i.subtotal
    end
    return sum
  end
end
