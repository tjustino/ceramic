class HomeController < ApplicationController
  include Banners
  include CurrentCart
  before_action :set_cart
  before_action :load_banners

  # GET /
  def index
    @meta_tags = MetaTag.where(id: Tag.select(:meta_tag_id).distinct).order(:name)
    @promoted_products = Product.promoted.order(:name)
  end

  # GET /whoami
  def whoami; end

  # GET /gallery
  def gallery; end
end
