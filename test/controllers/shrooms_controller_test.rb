require 'test_helper'

class ShroomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @user = users(:valid)
    @shroom = Shroom.create(name: 'test', description: 'test', edible: true,
                         genus: 'testus', user_id: @user.id, image: File.new("test/fixtures/shroom.jpg"))
  end

  test "show all shrooms" do
    get shrooms_path
    assert_response :success
  end

  test "should create shroom" do
    sign_in users(:valid)

    assert_difference('Shroom.count') do
      post shrooms_url, params: { shroom: @shroom.attributes }
    end

    assert_redirected_to(Shroom.first)
  end

  test "should not create shroom if user is not signed in" do

    assert_difference('Shroom.count', 0) do
      post shrooms_url, params: { shroom: @shroom.attributes }
    end

    assert_redirected_to(new_user_session_path)
  end

  test "should update shroom" do
    sign_in users(:valid)

    patch shroom_url(@shroom), params: { shroom: { name: "updated" } }

    @shroom.reload
    assert_equal "updated", @shroom.name
  end

  test "should destroy shroom" do
    sign_in users(:valid)
    
    assert_difference('Shroom.count', -1) do
      delete shroom_url(@shroom)
    end
 
    assert_redirected_to shrooms_path
  end

end