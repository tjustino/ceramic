# frozen_string_literal: true

# Carts Controller
class CartsController < ApplicationController
  before_action :restrict_access, only: %i[index new create]

  include Banners
  before_action :load_banners, only: %i[show]
  # include CurrentCart
  # before_action :set_cart,     only: %i[show edit update destroy]

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show; end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: "Cart was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: "Cart was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to carts_url, notice: "Cart was successfully destroyed."
  end

  private ######################################################################

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.fetch(:cart, {})
    end
end
