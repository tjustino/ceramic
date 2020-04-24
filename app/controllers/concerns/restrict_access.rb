# frozen_string_literal: true

# restrict access
module RestrictAccess
  private

    def set_current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end

    def restrict_to_admin
      store_desired_path
      redirect_to login_url unless user_id && User.find(user_id).is_admin?
    end

    def restrict_to_customer_and_admin
      user_id.nil? ? redirect_to(root_url) : yield
    end

    def restrict_to_visitor_and_admin
      if user_id.nil? || User.find(user_id).is_admin?
        yield
      else
        redirect_to root_url
      end
    end

    def user_id
      session[:user_id]
    end

    def spoofed_user
      !user_is_who_he_pretends_to_be && !@current_user.is_admin?
    end

    def user_is_who_he_pretends_to_be
      @current_user&.id == params[:id].to_i
    end

    def user_is_admin
      @current_user&.is_admin?
    end

    def user_is_customer
      @current_user.present? && !user_is_admin
    end

    def user_is_visitor
      user_id.nil?
    end

    def store_desired_path
      session[:desired_path] = request.fullpath if storable_location?
    end

    def storable_location?
      request.get? && !request.xhr?
    end
end
