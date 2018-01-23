class ProductsController < ApplicationController
	
	def index
		@products = Product.all
    @order = Order.where(id: session[:order_id]).first
	end

	def show
		@product = Product.find(params[:id])
    @order = Order.where(id: session[:order_id]).first
	end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :stock, :price, :image)
    end

end
