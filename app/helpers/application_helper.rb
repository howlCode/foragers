module ApplicationHelper

  def total_quantity(order)
    total = 0
    order.order_items.each do |q|
      total += q.quantity
    end
    return total
  end
  
end
