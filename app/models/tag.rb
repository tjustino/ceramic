class Tag < ApplicationRecord
  belongs_to :meta_tag
  has_many :product_tag_relations, dependent: :restrict_with_error
  has_many :products,              through: :product_tag_relations
end
