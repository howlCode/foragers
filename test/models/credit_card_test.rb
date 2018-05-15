require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase

  def setup
    @credit_card = credit_cards(:one)
  end

  test 'valid credit card' do
    assert @credit_card.valid?
  end

end