# frozen_string_literal: true

# Tags Controller
class TagsController < ApplicationController
  before_action :restrict_access
  before_action :set_tag,       only: %i[edit update destroy]
  before_action :set_meta_tags, only: %i[index new edit create update]

  # GET /tags
  def index; end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit; end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_url, notice: notice_message("créée")
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to tags_url, notice: notice_message("mise à jour")
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    if @tag.destroy
      redirect_to tags_url, notice: notice_message("supprimée")
    else
      redirect_to tags_url,
                  warning: "Impossible de surpprimer « #{@tag.name} »."
    end
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :meta_tag_id)
    end

    def set_meta_tags
      @meta_tags = MetaTag.all.order(:name)
    end

    def notice_message(action)
      "L'étiquette « #{@tag.name} » a été #{action}."
    end
end
