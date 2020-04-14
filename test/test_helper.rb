# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  # Test case start here!
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup fixtures in test/fixtures/*.yml for all tests in alphabetical order
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def login_as(user)
      unless user == :visitor
        post login_url,
             params: { email: users(user).email, password: "p@ssw0rd!" }
      end
    end
  end
end
