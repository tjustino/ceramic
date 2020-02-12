class SearchController < ApplicationController
  include CurrentCart
  before_action :set_cart

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
