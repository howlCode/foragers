class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]

  def create
    @order_item = @order.order_items.new(quantity: 1, product_id: params[:product_id])

    respond_to do |format|
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
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_url, notice: 'Order item was successfully deleted.' }
      format.json { head :no_content }
    end
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
