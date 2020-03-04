# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  # GET /users
  def index
    @users = User.all.order(is_admin: :desc, email: :asc)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: notice_message("créé")
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to users_url, notice: notice_message("mis à jour")
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      redirect_to users_url, notice: notice_message("supprimé")
    else
      redirect_to users_url,
                  warning: "Impossible de surpprimer « #{@user.email} »."
    end
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password_digest, :is_admin)
    end

    def notice_message(action)
      "L'utilisateur « #{@user.email} » a été #{action}."
    end
end
