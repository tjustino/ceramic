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

  validates :product_id, presence: true, on: :update # new Product don't have id
  validates :product_id, uniqueness: {
    scope:   :tag_id,
    message: "cette étiquette est déjà apposée sur ce produit"
  }
  validates :tag_id, presence: true
end
