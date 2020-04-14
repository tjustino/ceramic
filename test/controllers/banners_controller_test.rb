# frozen_string_literal: true

require "test_helper"

# Banners Controller Test
class BannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banner = banners(:current_month)
  end

  ################################################################# GET /banners
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get banners_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get banners_url
    assert_response :success
  end

  ############################################################### GET /banners/1
  test "should redirect show as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get banner_url(@banner)
      assert_redirected_to login_url
    end
  end

  test "should show banner as admin" do
    login_as(:admin)
    get banner_url(@banner)
    assert_response :success
  end

  ############################################################# GET /banners/new
  test "should redirect new as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get new_banner_url
      assert_redirected_to login_url
    end
  end

  test "should get new" do
    login_as(:admin)
    get new_banner_url
    assert_response :success
  end

  ########################################################## GET /banners/1/edit
  test "should redirect edit as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get edit_banner_url(@banner)
      assert_redirected_to login_url
    end
  end

  test "should get edit as admin" do
    login_as(:admin)
    get edit_banner_url(@banner)
    assert_response :success
  end

  ################################################################ POST /banners
  test "should redirect create as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Banner.count") { post_create(@banner) }
      assert_redirected_to login_url
    end
  end

  test "should create banner as admin" do
    login_as(:admin)
    assert_difference("Banner.count", +1) { post_create(@banner) }
    assert_redirected_to banners_url
  end

  ######################################################### PATCH/PUT /banners/1
  test "should redirect update as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      patch_update(@banner)
      assert_redirected_to login_url
      assert_equal @banner.message, @banner.reload.message
    end
  end

  test "should update banner as admin" do
    login_as(:admin)
    patch_update(@banner)
    assert_redirected_to banners_url
    assert_not_equal @banner.message, @banner.reload.message
  end

  ############################################################ DELETE /banners/1
  test "should redirect destroy as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Banner.count") { delete banner_url(@banner) }
      assert_redirected_to login_url
    end
  end

  test "should destroy banner as admin" do
    login_as(:admin)
    assert_difference("Banner.count", -1) { delete banner_url(@banner) }
    assert_redirected_to banners_url
  end

  private ######################################################################

    def post_create(banner)
      post banners_url, params: { banner: {
        end: banner.end, message: banner.message, start: banner.start
      } }
    end

    def patch_update(banner)
      patch banner_url(banner), params: { banner: {
        message: SecureRandom.hex, start: banner.start, end: banner.end
      } }
    end
end
