module ApplicationHelper

  def set_user_session(user)
    session[:user_id] = user.id
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to new_session_path unless current_user
  end

end
