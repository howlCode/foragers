require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
    @user2 = users(:valid2)
  end

  test 'valid user' do
  	assert @user.valid?
    assert @user2.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid if email already exists in DB' do
    @user.email = 'test@example.com'
    @user2.email = 'test@example.com'
    refute @user2.valid?
    assert_not_nil @user2.errors[:email]
  end

end
