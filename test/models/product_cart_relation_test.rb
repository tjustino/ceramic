# == Schema Information
#
# Table name: product_cart_relations
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  cart_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ProductCartRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
