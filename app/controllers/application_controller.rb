class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
 # filter for authenticating
 def require_login
      if current_user.nil?
        redirect_to login_path
      end
 end

end
