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
class ProductTagRelation < ApplicationRecord
  belongs_to :product
  belongs_to :tag

  validates :product_id, presence: true
  validates :tag_id,     presence: true
end
