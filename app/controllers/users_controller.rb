# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  include RestrictAccess
  before_action :restrict_to_admin, only: :index
  before_action :set_current_user,  only: %i[new edit create update destroy]

  # GET /admin/users
  def index
    @users = User.all.order(is_admin: :desc, email: :asc)
  end

  # GET /users/new
  def new
    restrict_to_visitor_and_admin { @user = User.new }
  end

  # GET /users/1/edit
  def edit
    restrict_to_customer_and_admin do
      set_user
      redirect_to edit_user_url(user_id) if spoofed_user
    end
  end

  # POST /admin/users
  def create
    restrict_to_visitor_and_admin do
      @user = User.new(user_params)

      if user_is_admin
        save_and_redirect_to(users_url)
      elsif user_is_visitor && params[:user][:is_admin] == "true"
        redirect_to new_user_url, warning: "T'es un rigolo toi..."
      else
        save_and_redirect_to(root_url)
        # TODO: auto-connect user
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    restrict_to_customer_and_admin do
      set_user

      if user_is_admin
        update_and_redirect_to(users_url)
      elsif user_is_customer && params[:user][:is_admin] == "true"
        redirect_to edit_user_url(user_id), warning: "T'es un rigolo toi..."
      elsif user_is_customer && user_id != @user.id
        redirect_to edit_user_url(user_id), warning: "T'es un rigolo toi..."
      else
        update_and_redirect_to(edit_user_url(@user))
      end
    end
  end

  # DELETE /users/1
  def destroy
    restrict_to_customer_and_admin do
      set_user

      if user_is_admin && user_id != @user.id
        destroy_and_redirect_to(users_url)
        # TODO: maybe should delete other things
      elsif user_is_customer && user_id == @user.id
        destroy_and_redirect_to(root_url)
        # TODO: maybe should delete other things
      else
        redirect_to edit_user_url(user_id), warning: "Impossible de surpprimer."
      end
    end
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params_allowed = %i[email password password_confirmation is_admin]
      params.require(:user).permit(params_allowed)
    end

    def notice_message(action)
      user = @user || @current_user
      "L'utilisateur « #{user.email} » a été #{action}."
    end

    def save_and_redirect_to(url)
      @user.save
      redirect_to url, notice: notice_message("créé")
    end

    def update_and_redirect_to(url)
      @user.update(user_params)
      redirect_to url, notice: notice_message("mis à jour")
    end

    def destroy_and_redirect_to(url)
      @user.destroy
      redirect_to url, notice: notice_message("supprimé")
    end
end
