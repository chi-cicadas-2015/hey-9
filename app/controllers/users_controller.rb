class UsersController < ApplicationController
  include ApplicationHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dogs/new"
    else
      render :new
    end
  end

  def show
    @user = current_user
    if @user.id != session[:user_id]
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}"
      else
        redirect_to "/sessions/new"
      end
    end
    if @user.lat && @user.lng
      @location = gen_neighborhood
      @messages = Message.within(1, :origin => location_get).all
      render :show
    end
  end

  def edit
    if params[:id].to_i != session[:user_id]
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}/edit"
      else
        redirect_to "/sessions/new"
      end
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def update
     @user = User.find(params[:id])
     @current_user = current_user
    if request.xhr?
      lat = params[:location][:lat]
      lng = params[:location][:lng]
      lat = lat.to_f
      lng = lng.to_f
      @user.update_attributes(lng: lng, lat: lat)
      @user.lat

      # @neighborhood = gen_neighborhood
      render :show
    else
      if @user.update_attributes(user_params)
          redirect_to "/users/#{@user.id}"
      else
        render :edit
      end
    end
  end

  def delete
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      redirect_to "/"
    else
      @user.destroy
      session.clear
      redirect_to "/"
    end
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end
end
