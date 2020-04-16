# frozen_string_literal: true

require "test_helper"

# Tags Controller Test
class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:magnets)
  end

  #################################################################### GET /tags
  test "should redirect index as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get tags_url
      assert_redirected_to login_url
    end
  end

  test "should get index as admin" do
    login_as(:admin)
    get tags_url
    assert_response :success
  end

  ################################################################ GET /tags/new
  test "should redirect new as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get new_tag_url
      assert_redirected_to login_url
    end
  end

  test "should get new" do
    login_as(:admin)
    get new_tag_url
    assert_response :success
  end

  ############################################################# GET /tags/1/edit
  test "should redirect edit as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      get edit_tag_url(@tag)
      assert_redirected_to login_url
    end
  end

  test "should get edit as admin" do
    login_as(:admin)
    get edit_tag_url(@tag)
    assert_response :success
  end

  ################################################################### POST /tags
  test "should redirect create as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Tag.count") do
        post tags_url, params: tag_params
      end
      assert_redirected_to login_url
    end
  end

  test "should create tag as admin" do
    login_as(:admin)
    assert_difference("Tag.count", +1) do
      post tags_url, params: tag_params
    end
    assert_redirected_to tags_url
  end

  ############################################################ PATCH/PUT /tags/1
  test "should redirect update as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      patch tag_url(@tag), params: tag_params
      assert_redirected_to login_url
      assert_equal @tag.name, @tag.reload.name
    end
  end

  test "should update tag as admin" do
    login_as(:admin)
    patch tag_url(@tag), params: tag_params
    assert_redirected_to tags_url
    assert_not_equal @tag.name, @tag.reload.name
  end

  ############################################################### DELETE /tags/1
  test "should redirect destroy as visitor and customer" do
    %i[visitor customer].each do |not_admin_user|
      login_as(not_admin_user)
      assert_no_difference("Tag.count") { delete tag_url(@tag) }
      assert_redirected_to login_url
    end
  end

  test "should destroy tag as admin" do
    login_as(:admin)
    assert_no_difference("Tag.count") { delete tag_url(@tag) }
    assert_redirected_to tags_url
    ProductTagRelation.destroy_all
    assert_difference("Tag.count", -1) { delete tag_url(@tag) }
    assert_redirected_to tags_url
  end

  private ######################################################################

    def tag_params
      { tag: { name: SecureRandom.hex, meta_tag_id: meta_tags(:bijoux).id } }
    end
end
