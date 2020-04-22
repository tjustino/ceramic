# frozen_string_literal: true

# Statics Controller
class StaticsController < ApplicationController
  include RestrictAccess
  before_action :restrict_to_admin, except: :show
  before_action :set_static,        only:   %i[show edit update]

  # GET /statics
  def index
    @pages = Static.pages
    @statics = Static.all
  end

  # GET /statics/1
  def show; end

  # GET /statics/1/edit
  def edit; end

  # PATCH/PUT /statics/1
  def update
    if @static.update(static_params)
      redirect_to statics_url, notice: notice_message("mise à jour")
    else
      render :edit
    end
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_static
      @static = Static.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def static_params
      params.require(:static).permit(:page, :content)
    end

    def notice_message(action)
      "La page statique a été #{action}."
    end
end
