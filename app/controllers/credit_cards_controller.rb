class CreditCardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@credit_cards = current_user.credit_cards.all
	end

	def new
		@credit_card = current_user.credit_cards.build
	end

	def create
		@credit_card = current_user.credit_cards.build(credit_card_params)
		@order = Order.where(id: session[:order_id]).first
		if @credit_card.save
      redirect_to order_path(@order), notice: 'Card information saved'
    else
      render 'new'
    end
  end

  def update
    @credit_card = current_user.credit_cards.find(params[:id])
    @order = Order.where(id: session[:order_id]).first
    if @credit_card.update(credit_card_params)
      redirect_to @order, notice: 'Your card information has been updated!'
    else
      render 'edit'
    end
  end 


	private
		def credit_card_params
			params.require(:credit_card).permit(:name, :brand, :account, :exp_month, :exp_year, :cvc)
		end
end
