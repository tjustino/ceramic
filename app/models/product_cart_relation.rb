# frozen_string_literal: true

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
class ProductCartRelation < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: true
  validates :cart_id,    presence: true
end
