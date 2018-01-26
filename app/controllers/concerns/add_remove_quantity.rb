module AddRemoveQuantity
	def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to Order.find(session[:order_id])
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity -= 1
    if @order_item.quantity == 0
      @order_item.destroy
      redirect_to Order.find(session[:order_id])
    else
      @order_item.save
      redirect_to Order.find(session[:order_id])
    end
  end
end