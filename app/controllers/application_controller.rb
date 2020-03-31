# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  add_flash_types :warning

  def restrict_access
    store_desired_path
    redirect_to login_url unless user_id && User.find(user_id).is_admin?
  end

  def set_current_user
    @current_user = User.find(user_id) if user_id
  end

  private ######################################################################

    def user_id
      session[:user_id]
    end

    def store_desired_path
      session[:desired_path] = request.fullpath if storable_location?
    end

    def storable_location?
      request.get? && !request.xhr?
    end
end
