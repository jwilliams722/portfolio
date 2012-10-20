class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def login_required
    if current_user.present?
      return true
    else
      session[:return_to_url] = request.env["REQUEST_URI"]
      redirect_to log_in_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end