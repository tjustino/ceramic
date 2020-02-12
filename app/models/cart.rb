class Cart < ApplicationRecord
  has_many :product_cart_relations, dependent: :restrict_with_error
  has_many :products, through: :product_cart_relations
end
