# frozen_string_literal: true

require "test_helper"

# Search Controller Test
class SearchControllerTest < ActionDispatch::IntegrationTest
  ################################################################## GET /search
  test "should get index" do
    %i[visitor customer admin].each do |any_user|
      login_as(any_user)
      get search_url
      assert_response :success
    end
  end
end
