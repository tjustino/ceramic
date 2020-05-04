# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  meta_tag_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Tag < ApplicationRecord
  belongs_to :meta_tag
  has_many :product_tag_relations, dependent: :restrict_with_error
  has_many :products,              through: :product_tag_relations

  validates :name,        presence: true, uniqueness: true
  validates :meta_tag_id, presence: true
end
