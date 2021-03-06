# frozen_string_literal: true

require "test_helper"

# Home Controller Test
class HomeControllerTest < ActionDispatch::IntegrationTest
  ######################################################################## GET /
  test "should get index" do
    %i[visitor customer admin].each do |any_user|
      login_as(any_user)
      get root_url
      assert_response :success
    end
  end
end
