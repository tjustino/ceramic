# frozen_string_literal: true

# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  message    :text             not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Banner < ApplicationRecord
  validates :message,    presence: true
  validates :start_date, presence: true
  validates :end_date,   presence: true
  validate  :date_consistency

  private ######################################################################

    def date_consistency
      return if start_date.blank? || end_date.blank?

      if start_date > end_date
        errors.add(:start_date, "incohérence dans les dates")
      end
    end
end
