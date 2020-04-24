# frozen_string_literal: true

require "test_helper"

# Users Controller Test
class UsersControllerTest < ActionDispatch::IntegrationTest
  ############################################################# GET /admin/users
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get users_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get users_url
    assert_response :success
  end

  ############################################################### GET /users/new
  test "should redirect new as customer" do
    login_as(:customer)
    get new_user_url
    assert_redirected_to root_url
  end

  test "should get new as visitor or admin" do
    %i[visitor admin].each do |visitor_or_admin|
      login_as(visitor_or_admin)
      get new_user_url
      assert_response :success
    end
  end

  ############################################################ GET /users/1/edit
  test "should redirect edit as visitor" do
    login_as(:visitor)
    get edit_user_url(users(:admin).id)
    assert_redirected_to root_url
    get edit_user_url(users(:customer).id)
    assert_redirected_to root_url
  end

  test "should get edit as customer or admin" do
    %i[customer admin].each do |customer_or_admin|
      login_as(customer_or_admin)
      get edit_user_url(users(customer_or_admin).id)
      assert_response :success
    end
  end

  test "should get edit is own user as customer" do
    login_as(:customer)
    get edit_user_url(users(:other_customer).id)
    assert_redirected_to edit_user_url(users(:customer).id)
  end

  test "should get edit any user as admin" do
    login_as(:admin)
    get edit_user_url(users(:customer).id)
    assert_response :success
  end

  ############################################################ POST /admin/users
  test "should redirect user as customer" do
    login_as(:customer)
    assert_no_difference("User.count") { post users_url, params: user_params }
    assert_redirected_to root_url
  end

  test "should not create admin account as visitor" do
    login_as(:visitor)
    assert_no_difference("User.count") do
      post users_url, params: user_params(is_admin: true)
    end
    assert_redirected_to new_user_url
  end

  test "should create admin account as admin" do
    login_as(:admin)
    assert_difference("User.count", +1) do
      post users_url, params: user_params(is_admin: true)
    end
    assert_redirected_to users_url
  end

  test "should create regular account as visitor or admin" do
    %i[visitor admin].each do |visitor_or_admin|
      login_as(visitor_or_admin)
      assert_difference("User.count", +1) do
        post users_url, params: user_params
      end
      assert_redirected_to(visitor_or_admin == :admin ? users_url : root_url)
    end
  end

  ########################################################### PATCH/PUT /users/1
  test "should redirect update as visitor" do
    login_as(:visitor)
    patch user_url(users(:customer).id), params: user_params
    assert_equal users(:customer).email, users(:customer).reload.email
    assert_redirected_to root_url
    patch user_url(users(:admin).id), params: user_params
    assert_equal users(:admin).email, users(:admin).reload.email
    assert_redirected_to root_url
  end

  test "should update only is own user as customer" do
    login_as(:customer)
    patch user_url(users(:customer).id), params: user_params
    assert_not_equal users(:customer).email, users(:customer).reload.email
    assert_redirected_to edit_user_url(users(:customer).id)
    patch user_url(users(:other_customer).id), params: user_params
    assert_equal users(:other_customer).email,
                 users(:other_customer).reload.email
    assert_redirected_to edit_user_url(users(:customer).reload.id)
    patch user_url(users(:admin).id), params: user_params(is_admin: true)
    assert_equal users(:admin).email, users(:admin).reload.email
    assert_redirected_to edit_user_url(users(:customer).reload.id)
  end

  test "should update any user as admin" do
    login_as(:admin)
    patch user_url(users(:customer).id), params: user_params
    assert_redirected_to users_url
    assert_not_equal users(:customer).email, users(:customer).reload.email
  end

  ############################################################## DELETE /users/1
  test "should redirect destroy as visitor" do
    login_as(:visitor)
    assert_no_difference("User.count") { delete user_url(:customer) }
    assert_redirected_to root_url
  end

  test "should destroy only is own user as customer" do
    login_as(:customer)
    assert_no_difference("User.count") do
      delete user_url(users(:other_customer))
    end
    assert_redirected_to edit_user_url(users(:customer))
    assert_difference("User.count", -1) { delete user_url(users(:customer)) }
    assert_redirected_to root_url
  end

  test "should destroy any user as admin but not his own" do
    login_as(:admin)
    assert_difference("User.count", -1) { delete user_url(users(:customer)) }
    assert_redirected_to users_url
    assert_no_difference("User.count") { delete user_url(users(:admin)) }
    assert_redirected_to edit_user_url(users(:admin))
  end

  private ######################################################################

    def user_params(is_admin: false)
      password = "p@ssw0rd!"
      { user: {
        email: "#{SecureRandom.hex}@domain.tld",
        password: password, password_confirmation: password, is_admin: is_admin
      } }
    end
end
