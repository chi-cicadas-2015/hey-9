class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = User.find_by(id: session[:id])
  end

  def location_get
      location = { :lat => current_user.lat, :lng => current_user.lng}
  end

  def gen_neighborhood

  end
end
