class HomeController < ApplicationController
  include ApplicationHelper
  def index
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      render :'home/index', :layout => false
    end
  end

end
