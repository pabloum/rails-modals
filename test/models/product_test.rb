require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    # Fixtures
    # @product1 = products(:published)
    # @product2 = products(:published)
    # @product3 = products(:not_published)

    Product.create(name: "iPhone", price: 159, published: true, cost: 1000)
    Product.create(name: "iPad", price: 999, published: false, cost: 1000)
    Product.create(name: "Mac", price: 1500, published: true, cost: 1000)
  end

  test ".word_count returns the correct number of words in name" do
    product = Product.new(name: "Hola mundo. Esto es una prueba!")
    assert_equal 6, product.word_count
  end

  test "published scope only returns published Products" do
    # products = Product.all.where(published: true)
    products = Product.published
    assert_equal 2, products.length
  end

  # Haga un test que pruebe que el método 'margen' calcule correctamente
  # el margen de los productos de loa productos en % (agregar el campo costo)

  test ".margin returns the margin between cost and price " do
    product = Product.new(price: 1500, cost: 1000)
    assert_equal 50, product.margin
  end

  # haga un test para el método stock_status el cual retorna si un
  # producto está disponible en inventario (agregar el campo quantity)
  test ".stock_status returns if a product is available" do
    product1 = Product.new(quantity: 5)
    product2 = Product.new(quantity: 0)

    assert_equal true,product1.stock_status
    assert_equal false,product2.stock_status
  end
end
