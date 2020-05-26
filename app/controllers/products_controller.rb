# frozen_string_literal: true

# Products Controller
class ProductsController < ApplicationController
  include RestrictAccess
  before_action :restrict_to_admin, except: %i[show]

  include Banners
  before_action :load_banners, only: %i[show]

  # include CurrentCart
  # before_action :set_cart, only: %i[to_cart]

  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_tags, only: %i[new create edit]

  # GET /admin/products
  def index
    @products = Product.all.order(is_promoted: :desc, name: :asc)
  end

  # GET /products/1
  def show
    respond_to do |format|
      format.html { @images_count = @product.images.count }
      format.js   { @image = params[:image] }
    end
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit; end

  # POST /admin/products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url, notice: notice_message("créé")
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to products_url, notice: notice_message("mise à jour")
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: notice_message("supprimé")
  end

  # POST /products/1/to_cart
  # def to_cart
  #   ProductCartRelation.create(product_id: @product.id, cart_id: @cart.id)
  #   redirect_to cart_url(@cart), notice: "Ajoute au panier !"
  # end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product)
            .permit(
              :name, :description, :price, :quantity, :is_promoted, tag_ids: [], images: []
            )
    end

    def set_tags
      @tags = Tag.order(:name)
    end

    def notice_message(action)
      "Le produit « #{@product.name} » a été #{action}."
    end
end
