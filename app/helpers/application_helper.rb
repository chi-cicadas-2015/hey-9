module ApplicationHelper

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to new_session_path unless current_user
  end

end
