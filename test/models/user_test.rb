# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

# User Tests
class UserTest < ActiveSupport::TestCase
  test "should create user" do
    user = User.new(email: "mail@domain.tld", password: "p@ssw0rd!")
    assert user.valid?
  end

  test "should not create user with not null data" do
    missing_email = User.new(email: nil, password: "p@ssw0rd!")
    assert missing_email.invalid?
    assert_equal ["ne peut pas être vide", "n'est pas valide"],
                 missing_email.errors[:email]

    missing_password = User.new(email: "mail@domain.tld", password: nil)
    assert missing_password.invalid?
    assert_equal ["doit comporter au minimum 6 caractères",
                  "ne peut pas être vide"], missing_password.errors[:password]
  end

  test "should not create user whose email has already been taken" do
    duplicated_email = User.new(email: User.first.email, password: "p@ssw0rd!")
    assert duplicated_email.invalid?
    assert_equal ["a déjà été pris"], duplicated_email.errors[:email]
  end

  test "should not create user with invalid email format" do
    user1 = User.new(email: "@domain.tld", password: "p@ssw0rd!")
    assert user1.invalid?

    user2 = User.new(email: "email@domain", password: "p@ssw0rd!")
    assert user2.invalid?

    user3 = User.new(email: "email@tld", password: "p@ssw0rd!")
    assert user3.invalid?

    user4 = User.new(email: "mail_domain.tld", password: "p@ssw0rd!")
    assert user4.invalid?

    user5 = User.new(email: "mail@domain.t", password: "p@ssw0rd!")
    assert user5.invalid?
  end

  test "should not create user with invalid password length" do
    user = User.new(email: "mail@domain.tld", password: "12345")
    assert user.invalid?
    assert_equal ["doit comporter au minimum 6 caractères"],
                 user.errors[:password]
  end
end
