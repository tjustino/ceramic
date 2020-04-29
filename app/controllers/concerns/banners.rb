# frozen_string_literal: true

# Banners
module Banners
  private

    def load_banners
      now = Date.current
      @banners = Banner.where(
        ["start_date <= :now and end_date >= :now", { now: now }]
      )
    end
end
