class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]

  def create
    # @order_item = @order.order_items.new(quantity: 1, product_id: params[:product_id])
    @order_item = @order.order_items.where(product_id: params[:product_id]).first_or_initialize
    respond_to do |format|
      @order_item.quantity += 1
      if @order_item.save
        format.html { redirect_to products_path, notice: 'Successfully added product to cart.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_url, notice: 'Item was successfully removed from your order.' }
      format.json { head :no_content }
    end
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to Order.find(session[:order_id])
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    if @order_item.quantity > 1
      @order_item.quantity -= 1
    end
    @order_item.save
    redirect_to Order.find(session[:order_id])
  end

  private 
    def load_order
      @order = Order.where(id: session[:order_id]).first_or_initialize
      if @order.new_record?
        @order.save!
        session[:order_id] = @order.id
      end
    end
end
