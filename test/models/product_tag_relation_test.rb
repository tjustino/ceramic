# frozen_string_literal: true

# == Schema Information
#
# Table name: product_tag_relations
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ProductTagRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
