# frozen_string_literal: true

require "test_helper"

# Session Controller Test
class SessionControllerTest < ActionDispatch::IntegrationTest
  ################################################################### GET /login
  test "should get login as visitor" do
    login_as(:visitor)
    get login_url
    assert_response :success
  end

  test "should redirect login as customer and admin" do
    %i[customer admin].each do |already_connected_user|
      login_as(already_connected_user)
      get login_url
      assert_redirected_to root_url
    end
  end

  ################################################################## POST /login
  test "should create session as customer and admin" do
    %i[customer admin].each do |any_user|
      login_as(any_user)
      assert_redirected_to root_url
      get edit_user_url(users(any_user))
      assert_response :success
    end
  end

  test "should not create session with wrong credentials" do
    post login_url, params: { email: users(:admin).email, password: "wrongPWD" }
    assert_redirected_to login_url
    get admin_url
    assert_redirected_to login_url
  end

  ############################################################### DELETE /logout
  test "should destroy session when logout" do
    %i[customer admin].each do |any_user|
      login_as(any_user)
      delete logout_url
      assert_redirected_to root_url
      get admin_url
      assert_redirected_to login_url
    end
  end
end
