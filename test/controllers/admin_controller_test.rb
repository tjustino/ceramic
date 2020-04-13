# frozen_string_literal: true

require "test_helper"

# Admin Controller Test
class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should redirect index as regular" do
    get admin_url
    assert_redirected_to login_url
  end

  test "should redirect index as customer" do
    login_as(:customer)
    get admin_url
    assert_redirected_to login_url
  end

  test "should get index as admin" do
    login_as(:admin)
    get admin_url
    assert_response :success
  end
end
