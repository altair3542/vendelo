require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'render a list of products' do
    get '/products'
    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detailed product page' do
    get product_path(products(:ps4))
    assert_response :success
    assert_select '.title', 'ps4 fat'
    assert_select '.description', 'ps4 en buen estado'
    assert_select '.price', '150$'
  end

  test 'render a new product form' do
    get new_product_path
    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'ps4 slim',
        description: 'ps4 en buen estado',
        price: 200

    }
  }
    assert_redirected_to /products\/\d+/
  end


  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'ps4 en buen estado',
        price: 200

    }
  }
    assert_response :unprocessable_entity
  end
end
