# frozen_string_literal: true

require "test_helper"

# Products Controller Test
class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:product_01)
  end

  ############################################################### GET /products
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get products_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get products_url
    assert_response :success
  end

  ############################################################## GET /products/1
  test "should show product" do
    %i[visitor customer admin].each do |any_user|
      login_as(any_user)
      get product_url(@product)
      assert_response :success
    end
  end

  ############################################################ GET /products/new
  test "should redirect new as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get new_product_url
      assert_redirected_to login_url
    end
  end

  test "should get new" do
    login_as(:admin)
    get new_product_url
    assert_response :success
  end

  ######################################################### GET /products/1/edit
  test "should redirect edit as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get edit_product_url(@product)
      assert_redirected_to login_url
    end
  end

  test "should get edit as admin" do
    login_as(:admin)
    get edit_product_url(@product)
    assert_response :success
  end

  ############################################################### POST /products
  test "should redirect create as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Product.count") do
        post products_url, params: product_params
      end
      assert_redirected_to login_url
    end
  end

  test "should create product as admin" do
    login_as(:admin)
    assert_difference("Product.count", +1) do
      post products_url, params: product_params
    end
    assert_redirected_to products_url
  end

  ######################################################## PATCH/PUT /products/1
  test "should redirect update as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      patch product_url(@product), params: product_params
      assert_redirected_to login_url
      assert_equal @product.name, @product.reload.name
    end
  end

  test "should update product as admin" do
    login_as(:admin)
    patch product_url(@product), params: product_params
    assert_redirected_to products_url
    assert_not_equal @product.name, @product.reload.name
  end

  ########################################################### DELETE /products/1
  test "should redirect destroy as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Product.count") { delete product_url(@product) }
      assert_redirected_to login_url
    end
  end

  test "should destroy product as admin" do
    login_as(:admin)
    assert_difference("Product.count", -1) { delete product_url(@product) }
    assert_redirected_to products_url
  end

  private ######################################################################

    def product_params
      { product: {
        name: SecureRandom.hex, decription: SecureRandom.hex,
        price: rand(1..100.00), is_promoted: rand(0..1) == 1
      } }
    end
end
