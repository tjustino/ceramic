# frozen_string_literal: true

# Session Controller
class SessionController < ApplicationController
  # GET /login
  def new
    redirect_back(fallback_location: root_url) if session[:user_id].present?
  end

  # POST /login
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to desired_path, notice: "Connexion réussie"
    else
      redirect_to login_url, alert: "Mauvaise combinaison mail / mot de passe"
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_back fallback_location: root_url, notice: "Déconnexion réussie"
  end

  private

    def desired_path
      session[:desired_path].present? ? session[:desired_path] : root_path
    end
end
