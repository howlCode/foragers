class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :create, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @order.update(order_params.merge(status: 'submitted'))
      session[:order_id] = nil
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @order.destroy
    redirect_to products_path, notice: 'Cart is empty.'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :status, :address_id)
    end
end
