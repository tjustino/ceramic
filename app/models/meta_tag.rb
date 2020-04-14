# frozen_string_literal: true

# == Schema Information
#
# Table name: meta_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MetaTag < ApplicationRecord
  has_many :tags, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
