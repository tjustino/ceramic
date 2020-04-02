# frozen_string_literal: true

require "test_helper"

# Search Controller Test
class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_index_url
    assert_response :success
  end
end
