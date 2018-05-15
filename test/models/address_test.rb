require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  def setup
    @address = addresses(:one)
  end

  test 'valid address' do
    assert @address.valid?
  end

end