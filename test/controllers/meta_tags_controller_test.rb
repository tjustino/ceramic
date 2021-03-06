# frozen_string_literal: true

require "test_helper"

# Meta Tags Controller Test
class MetaTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meta_tag = meta_tags(:bijoux)
  end

  ######################################################### GET /admin/meta_tags
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get meta_tags_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get meta_tags_url
    assert_response :success
  end

  ##################################################### GET /admin/meta_tags/new
  test "should redirect new as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get new_meta_tag_url
      assert_redirected_to login_url
    end
  end

  test "should get new" do
    login_as(:admin)
    get new_meta_tag_url
    assert_response :success
  end

  ################################################## GET /admin/meta_tags/1/edit
  test "should redirect edit as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get edit_meta_tag_url(@meta_tag)
      assert_redirected_to login_url
    end
  end

  test "should get edit as admin" do
    login_as(:admin)
    get edit_meta_tag_url(@meta_tag)
    assert_response :success
  end

  ######################################################## POST /admin/meta_tags
  test "should redirect create as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("MetaTag.count") do
        post meta_tags_url, params: meta_tag_params
      end
      assert_redirected_to login_url
    end
  end

  test "should create meta_tag as admin" do
    login_as(:admin)
    assert_difference("MetaTag.count", +1) do
      post meta_tags_url, params: meta_tag_params
    end
    assert_redirected_to meta_tags_url
  end

  ################################################# PATCH/PUT /admin/meta_tags/1
  test "should redirect update as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      patch meta_tag_url(@meta_tag), params: meta_tag_params
      assert_redirected_to login_url
      assert_equal @meta_tag.name, @meta_tag.reload.name
    end
  end

  test "should update meta_tag as admin" do
    login_as(:admin)
    patch meta_tag_url(@meta_tag), params: meta_tag_params
    assert_redirected_to meta_tags_url
    assert_not_equal @meta_tag.name, @meta_tag.reload.name
  end

  #################################################### DELETE /admin/meta_tags/1
  test "should redirect destroy as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("MetaTag.count") { delete meta_tag_url(@meta_tag) }
      assert_redirected_to login_url
    end
  end

  test "should destroy meta_tag as admin" do
    login_as(:admin)
    assert_no_difference("MetaTag.count") { delete meta_tag_url(@meta_tag) }
    assert_redirected_to meta_tags_url

    ProductTagRelation.destroy_all
    @meta_tag.tags.destroy_all
    assert_difference("MetaTag.count", -1) { delete meta_tag_url(@meta_tag) }
    assert_redirected_to meta_tags_url
  end

  private ######################################################################

    def meta_tag_params
      { meta_tag: { name: SecureRandom.hex } }
    end
end
