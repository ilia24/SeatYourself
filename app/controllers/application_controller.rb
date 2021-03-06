class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_logged_in
      unless current_user
        flash[:alert] = "Please log in"
        redirect_to new_session_url
      end
  end

private

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def current_user_id
    session[:user_id]
  end
  helper_method :current_user_id
  helper_method :current_user
end
