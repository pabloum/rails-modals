require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get products_index_url
  #   assert_response :success
  # end

  test "get index: is successful" do
    sign_in users(:pumo)
    get products_path
    assert_response :success
  end

  test "is redirected to login if user is not authenticated" do
    get products_path
    assert_response :redirect
  end

  test "post create: creates a product" do
    sign_in users(:pumo)
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "product 1", published: true, price: 360 } }
    end
    assert_redirected_to products_path
  end

end

##rails test test/controllers/products_controller_test.rb:5
