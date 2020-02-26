# frozen_string_literal: true

# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  message    :text             not null
#  start      :datetime         not null
#  end        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Banner < ApplicationRecord
  validates :message, presence: true
  validates :start,   presence: true
  validates :end,     presence: true
end
