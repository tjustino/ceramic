# frozen_string_literal: true

require "test_helper"

# Admin Controller Test
class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end
end
