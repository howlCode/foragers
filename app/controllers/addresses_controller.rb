class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:update, :create]

	def new
		@address = current_user.addresses.build
	end

	def edit
    @address = current_user.addresses.find(params[:id])
  end

	def create
		@address = current_user.addresses.build(addresses_params)
		if @address.save
      redirect_to order_path(@order), notice: 'Address Saved'
    else
      render 'new'
    end
  end

  def update
    @address = current_user.addresses.find(params[:id])
    if @address.update(addresses_params)
      redirect_to @order, notice: 'Your address has been updated!'
    else
      render 'edit'
    end
  end

  private
    def addresses_params
      params.require(:address).permit(:line1, :city, :state, :zip)
    end

    def set_order
      @order = Order.where(id: session[:order_id]).first
    end
end
