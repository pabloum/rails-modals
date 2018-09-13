require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get products_index_url
  #   assert_response :success
  # end

  test "get index: is successful" do
    get products_path
    assert_response :success
  end

  test "post create: creates a product" do
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "product 1", published: true, price: 360 } }
    end
    assert_redirected_to products_path
  end

end
