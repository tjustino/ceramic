# frozen_string_literal: true

# == Schema Information
#
# Table name: statics
#
#  id         :integer          not null, primary key
#  page       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Static < ApplicationRecord
  enum page: { terms: 0, privacy: 1, gallery: 2, whoami: 3 }
  has_rich_text :content
end
