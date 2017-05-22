class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_permission

  def current_user
    @user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def require_permission
    unless current_user == Link.find(params[:id]).user
      render file: "public/404"
    end
  end
end
