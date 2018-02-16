class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :destroy, :update]
  include AddRemoveQuantity

  def create
    @order_item = @order.order_items.where(product_id: params[:product_id]).first_or_initialize
    @order_item.quantity += 1
    if @order_item.save
      redirect_to products_path, notice: 'Successfully added product to cart.'
    else
      render :new
    end
  end

  def update
    if @order_item.update
      redirect_to Order.find(session[:order_id]), notice: 'Item successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to Order.find(session[:order_id]), notice: 'Item was successfully removed from your order.'
  end

  private 
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def load_order
      user = current_user
      @order = Order.where(id: session[:order_id], user_id: user[:id]).first_or_initialize
      if @order.new_record?
        @order.save!
        session[:order_id] = @order.id
      end
    end
end
