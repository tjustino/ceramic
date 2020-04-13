# frozen_string_literal: true

# Products Controller
class ProductsController < ApplicationController
  before_action :restrict_access, except: %i[show to_cart]

  include Banners
  before_action :load_banners, only: %i[show]

  # include CurrentCart
  # before_action :set_cart, only: %i[to_cart]

  before_action :set_product, only: %i[show edit update destroy to_cart]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  # POST /products/1/to_cart
  def to_cart
    ProductCartRelation.create(product_id: @product.id, cart_id: @cart.id)
    redirect_to cart_url(@cart), notice: "Ajouté au panier !"
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :decription, :price, :is_promoted)
    end
end
