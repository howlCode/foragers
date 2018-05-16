require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @order = Order.new(user_id: users(:valid).id, address_id: addresses(:one).id,
    									 credit_card_id: credit_cards(:one).id, status: 'unsubmitted')
  end

  test 'valid order' do
    assert @order.valid?
  end

end