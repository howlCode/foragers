module ProductHelper
  def print_stock(stock, requested = 1)
    if stock > 0
      return content_tag(:p, "In stock!", class: "tag is-medium has-text-success is-uppercase")
    elsif stock == 0
      return content_tag(:span, "Out of Stock", class: "tag is-medium has-text-danger is-uppercase")
    elsif stock < requested
      return content_tag(:span, "Insufficient stock (#{stock})", class: "has-text-warning")
    end
  end
end
