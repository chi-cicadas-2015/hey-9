class MapsController < ApplicationController
  include ApplicationHelper
  def index
    @user = User.find_by(id: current_user.id)
    if @user.lng && @user.lat
      @location_array = [@user.lat, @user.lng]
    else
      redirect_to "/users/<%= @user.id %>"
    end

  end


end
