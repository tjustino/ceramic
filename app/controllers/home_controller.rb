# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  include Banners
  include CurrentCart
  before_action :set_cart
  before_action :load_banners

  # GET /
  def index
    @meta_tags = MetaTag.where(id: Tag.select(:meta_tag_id).distinct)
                        .order(:name)
    @promoted_products = Product.promoted.order(:name)
  end
end
