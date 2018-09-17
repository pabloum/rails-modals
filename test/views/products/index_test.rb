require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest

  def setup
    @product1 = Product.create(name: "Something", price: 666, published: true)
    @product2 = Product.create(name: "El falso", price: 777, published: false)
    @product3 = Product.create(name: "Something", price: 888, published: true)
  end

  #En el contexto del test crear un producto y verificar que este exista en el index
  test 'index render correctly' do
    sign_in users (:pumo)
    get products_path
    assert_select "h1", "Products"
    assert_select "a", "Nuevo Producto"
    assert_select "th", "Nombre"
    assert_select "th", "Precio"
    assert_select "td", "#{@product1.name}"
    assert_select "td", "$666.00"
  end

  #a travéS  de un test probar que en el index sólo se muestren los productos con el atributo published
  test 'index only shows published products' do
    sign_in users (:pumo)
    get products_path
    assert_select "td", "#{@product1.name}"
    assert_select "td", "#{@product3.name}"
    assert_select "tr", 3
    assert_select "td", {:count=>0, :text => @product2.name}

  end
end
