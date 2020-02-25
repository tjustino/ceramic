# frozen_string_literal: true

# Banners
module Banners
  private

    def load_banners
      now = DateTime.now
      @banners = Banner.where(["start < :now and end > :now", { now: now }])
    end
end
