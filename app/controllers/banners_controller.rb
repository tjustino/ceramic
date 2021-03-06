# frozen_string_literal: true

# Banners Controller
class BannersController < ApplicationController
  include RestrictAccess
  before_action :restrict_to_admin
  before_action :set_banner, only: %i[show edit update destroy]

  # GET /admin/banners
  def index
    @banners = Banner.all.order(:start_date)
  end

  # GET /admin/banners/1
  def show; end

  # GET /admin/banners/new
  def new
    @banner = Banner.new
  end

  # GET /admin/banners/1/edit
  def edit; end

  # POST /admin/banners
  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to banners_url, notice: notice_message("créée")
    else
      render :new
    end
  end

  # PATCH/PUT /admin/banners/1
  def update
    if @banner.update(banner_params)
      redirect_to banners_url, notice: notice_message("mise à jour")
    else
      render :edit
    end
  end

  # DELETE /admin/banners/1
  def destroy
    if @banner.destroy
      redirect_to banners_url, notice: notice_message("supprimée")
    else
      redirect_to banners_url,
                  warning: "Impossible de surpprimer la bannière."
    end
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def banner_params
      params.require(:banner).permit(:message, :start_date, :end_date)
    end

    def notice_message(action)
      "La bannière a été #{action}."
    end
end
