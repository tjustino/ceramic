# frozen_string_literal: true

# Search Controller
class SearchController < ApplicationController
  include Banners
  # include CurrentCart
  before_action :load_banners, only: :index
  # before_action :set_cart

  # GET /search
  def index
    if params[:tag]
      begin
        @products = Tag.find(params[:tag]).products
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, warning: "Le tag #{params[:tag]} n'existe pas !"
      end
    else
      @products = Product.all
    end
  end
end
