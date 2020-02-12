class MetaTag < ApplicationRecord
  has_many :tags, dependent: :restrict_with_error
end
