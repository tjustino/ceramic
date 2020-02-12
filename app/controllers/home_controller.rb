class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  # GET /
  def index
    @meta_tags = MetaTag.all.order(:name)
    @promoted_products = Product.promoted.order(:name)
  end

  # GET /whoami
  def whoami; end

  # GET /gallery
  def gallery; end
end
