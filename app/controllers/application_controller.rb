# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  add_flash_types :warning

  def restrict_access
    redirect_to login_url unless user_id && User.find(user_id).is_admin?
  end

  def set_current_user
    @current_user = User.find(user_id) if user_id
  end

  def store_user_location
    session[:location] = request.fullpath if storable_location?
  end

  private ######################################################################

    def user_id
      session[:user_id]
    end

    def storable_location?
      request.get? && !request.xhr?
    end
end
