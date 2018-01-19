module ProductHelper
  def print_stock(stock, requested = 1)
    if stock > 0
      return content_tag(:span, "In stock!", class: "has-text-success")
    elsif stock == 0
      return content_tag(:span, "Out of Stock", class: "has-text-danger")
    elsif stock < requested
      return content_tag(:span, "Insufficient stock (#{stock})", class: "has-text-warning")
    end
  end
end
