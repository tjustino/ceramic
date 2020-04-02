# frozen_string_literal: true

require "test_helper"

# Meta Tags Controller Test
class MetaTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meta_tag = meta_tags(:one)
  end

  test "should get index" do
    get meta_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_meta_tag_url
    assert_response :success
  end

  test "should create meta_tag" do
    assert_difference("MetaTag.count") do
      post meta_tags_url, params: { meta_tag: { name: @meta_tag.name } }
    end

    assert_redirected_to meta_tag_url(MetaTag.last)
  end

  test "should show meta_tag" do
    get meta_tag_url(@meta_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_meta_tag_url(@meta_tag)
    assert_response :success
  end

  test "should update meta_tag" do
    patch meta_tag_url(@meta_tag), params: {
      meta_tag: { name: @meta_tag.name }
    }
    assert_redirected_to meta_tag_url(@meta_tag)
  end

  test "should destroy meta_tag" do
    assert_difference("MetaTag.count", -1) do
      delete meta_tag_url(@meta_tag)
    end

    assert_redirected_to meta_tags_url
  end
end
