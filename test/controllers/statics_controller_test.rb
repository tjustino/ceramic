# frozen_string_literal: true

require "test_helper"

# Statics Controller Test
class StaticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @static = statics(:terms)
  end

  ################################################################# GET /statics
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get statics_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get statics_url
    assert_response :success
  end

  ############################################################### GET /statics/1
  # https://github.com/rails/rails/issues/38973
  test "should show static" do
    %i[visitor customer admin].each do |any_user|
      login_as(any_user)
      get static_url(@static)
      assert_response :success
    end
  end

  ########################################################## GET /statics/1/edit
  test "should redirect edit as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get edit_static_url(@static)
      assert_redirected_to login_url
    end
  end

  test "should get edit as admin" do
    login_as(:admin)
    get edit_static_url(@static)
    assert_response :success
  end

  ######################################################### PATCH/PUT /statics/1
  test "should redirect update as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      original_content = @static.content.to_s
      login_as(not_admin_user)
      patch static_url(@static), params: static_params
      assert_redirected_to login_url
      assert_equal original_content, @static.reload.content.to_s
    end
  end

  test "should update static as admin" do
    original_content = @static.content.to_s
    login_as(:admin)
    patch static_url(@static), params: static_params
    assert_redirected_to statics_url
    assert_not_equal original_content, @static.reload.content.to_s
  end

  private ####################################################################

    def static_params
      { static: { page: @static.page, content: SecureRandom.hex } }
    end
end
