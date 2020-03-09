class LegalsController < ApplicationController
  before_action :set_legal, only: [:show, :edit, :update, :destroy]

  # GET /legals
  def index
    @legals = Legal.all
  end

  # GET /legals/1
  def show
  end

  # GET /legals/new
  def new
    @legal = Legal.new
  end

  # GET /legals/1/edit
  def edit
  end

  # POST /legals
  def create
    @legal = Legal.new(legal_params)

    if @legal.save
      redirect_to @legal, notice: 'Legal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /legals/1
  def update
    if @legal.update(legal_params)
      redirect_to @legal, notice: 'Legal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /legals/1
  def destroy
    @legal.destroy
    redirect_to legals_url, notice: 'Legal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal
      @legal = Legal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def legal_params
      params.require(:legal).permit(:title, :content)
    end
end
