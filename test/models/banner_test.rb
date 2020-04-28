# frozen_string_literal: true

# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  message    :text             not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

# Banner Tests
class BannerTest < ActiveSupport::TestCase
  test "should create banner" do
    banner = Banner.new(message: rand_text, start_date: start_date,
                                                             end_date: end_date)
    assert banner.valid?
  end

  test "should not create banner with not null data" do
    missing_message = Banner.new(message: nil, start_date: start_date,
                                                             end_date: end_date)
    assert missing_message.invalid?
    assert_equal ["ne peut pas être vide"], missing_message.errors[:message]

    missing_start = Banner.new(message: rand_text, start_date: nil,
                                                             end_date: end_date)
    assert missing_start.invalid?
    assert_equal ["ne peut pas être vide"], missing_start.errors[:start_date]

    missing_end = Banner.new(message: rand_text, start_date: start_date,
                                                                  end_date: nil)
    assert missing_end.invalid?
    assert_equal ["ne peut pas être vide"], missing_end.errors[:end_date]
  end

  test "should not create banner if start date is after end" do
    banner = Banner.new(message: rand_text, start_date: end_date,
                                                           end_date: start_date)
    assert banner.invalid?
    assert_equal ["incohérence dans les dates"], banner.errors[:start_date]
  end

  private ######################################################################

    def rand_text
      SecureRandom.hex
    end

    def start_date
      DateTime.current.beginning_of_month - 1.month
    end

    def end_date
      start_date.end_of_month
    end
end
