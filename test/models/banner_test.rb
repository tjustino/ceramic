# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  message    :text             not null
#  start      :datetime         not null
#  end        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
