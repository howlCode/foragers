require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @order = orders(:one)
  end

  test 'valid order' do
    assert @order.valid?
  end

end