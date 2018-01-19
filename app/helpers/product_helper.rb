module ProductHelper
  def print_stock(stock)
    if stock > 0
      return content_tag(:span, "In stock!", class: "has-text-success")
    else
      return content_tag(:span, "Out of Stock", class: "has-text-danger")
    end
  end
end
