# frozen_string_literal: true

require "test_helper"

# Admin Controller Test
class AdminControllerTest < ActionDispatch::IntegrationTest
  ################################################################### GET /admin
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get admin_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get admin_url
    assert_response :success
  end
end
