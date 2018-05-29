class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_order, only: [:index, :show]
  before_action :set_product, except: [:index, :new, :create]

	def index
		@products = Product.all
	end

	def show
    respond_to do |format|
      format.js
    end
	end

  def new
    @product = Product.new
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)
      if @product.save
        redirect_to products_path
      else
        render 'new'
      end
    else
      flash[:now] = "You're not allowed"
      redirect_to products_path
    end

  end

  def edit
  end

  def update
    if current_user.admin? 
      if @product.update(product_params)
        redirect_to products_path
      end
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.admin?
      @product.destroy
      redirect_to products_path
    else
      redirect_to new_user_session_path
    end  
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :stock, :price, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_order
      @order = Order.where(id: session[:order_id]).first
    end
end
