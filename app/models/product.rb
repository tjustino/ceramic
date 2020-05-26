# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  price       :decimal(8, 2)    not null
#  is_promoted :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_many :product_tag_relations, inverse_of: :product, dependent: :delete_all
  has_many :tags, through: :product_tag_relations
  # has_many :product_cart_relations, dependent: :restrict_with_error
  # has_many :carts,                  through:   :product_cart_relations
  has_many_attached :images

  # before_destroy :ensure_not_referenced_by_any_line_item

  scope :promoted, -> { where(is_promoted: true) }

  validates :name,  presence: true, uniqueness:   true
  validates :price, presence: true, numericality: true
  validates :tags,  length: {
    minimum: 1, message: "doit comporter au moins une étiquette"
  }
  validates :images, length: {
    minimum: 1, message: "doit comporter au moins une image"
  }

  # private
  #   def ensure_not_referenced_by_any_line_item
  #     unless line_items.empty?
  #       errors.add(:base, "Linte Items present")
  #       throw :abort
  #     end
  #   end
end
