require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @user = users(:valid)
    @admin = users(:admin)
    @product = products(:one)
  end

  test "should not create product if user is not admin" do
    sign_in @user
    image = fixture_file_upload 'product.jpg'
    post products_path, params: { product: { name: @product.name, price: @product.price,
                                            description: @product.description, image: image } }

    assert_redirected_to(products_path)
  end

  test "should update product if user is admin" do
    sign_in @admin
    image = fixture_file_upload 'product.jpg'
    @product = Product.create(name: @product.name, price: @product.price,
                   description: @product.description, image: image)

    patch product_url(@product), params: { product: { name: "updated" } }

    @product.reload  
    assert_equal "updated", @product.name
  end

  test "should destroy product if user is admin" do
    sign_in @admin

    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end
 
    assert_redirected_to products_path
  end

end