require 'test_helper'

class ShroomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @user = users(:valid)
    @shroom = shrooms(:one)
  end

  test "show all shrooms" do
    get shrooms_path
    assert_response :success
  end

  test "should create shroom" do
    sign_in @user
    image = fixture_file_upload 'shroom.jpg'
    assert_difference('Shroom.count') do
      post shrooms_url, params: { shroom: { name: @shroom.name, genus: @shroom.genus, edible: @shroom.edible,
                                            description: @shroom.description, image: image } }
    end

    assert_redirected_to shrooms_url
  end

  test "should not create shroom if user is not signed in" do
    image = fixture_file_upload 'shroom.jpg'
    assert_difference('Shroom.count', 0) do
      post shrooms_url, params: { shroom: { name: @shroom.name, genus: @shroom.genus, edible: @shroom.edible,
                                            description: @shroom.description, image: image } }
    end

    assert_redirected_to(new_user_session_path)
  end

  test "should update shroom" do
    sign_in @user
    image = fixture_file_upload 'shroom.jpg'
    @shroom = Shroom.create(name: @shroom.name, genus: @shroom.genus, edible: @shroom.edible,
                         description: @shroom.description, image: image, user_id: @user.id)
    patch shroom_url(@shroom), params: { shroom: { name: "updated" } }

    @shroom.reload  
    assert_equal "updated", @shroom.name
  end

  test "should destroy shroom" do
    sign_in @user
    
    assert_difference('Shroom.count', -1) do
      delete shroom_url(@shroom)
    end
 
    assert_redirected_to shrooms_path
  end

end