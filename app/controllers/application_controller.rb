class ApplicationController < ActionController::Base
  add_flash_types :warning

  def restrict_access
    unless User.find(session[:user_id]).is_admin?
      redirect_to root_url
    end
  end
end
