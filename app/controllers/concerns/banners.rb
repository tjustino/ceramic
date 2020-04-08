# frozen_string_literal: true

# Banners
module Banners
  private

    def load_banners
      now = Date.current
      @banners = Banner.where(["start <= :now and end >= :now", { now: now }])
    end
end
