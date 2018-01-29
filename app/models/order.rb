class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true
  belongs_to :credit_card, optional: true
  has_many :order_items, dependent: :destroy

  def total
    sum = 0
    self.order_items.each do |i|
      sum += i.subtotal
    end
    return sum
  end
end
