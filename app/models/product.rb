class Product < ApplicationRecord
  has_many :product_tag_relations,  dependent: :restrict_with_error
  has_many :product_cart_relations, dependent: :restrict_with_error
  has_many :tags,                   through:   :product_tag_relations
  has_many :carts,                  through:   :product_cart_relations

  # before_destroy :ensure_not_referenced_by_any_line_item

  scope :promoted, -> { where(is_promoted: true) }

  # private
  #   def ensure_not_referenced_by_any_line_item
  #     unless line_items.empty?
  #       errors.add(:base, "Linte Items present")
  #       throw :abort
  #     end
  #   end
end
