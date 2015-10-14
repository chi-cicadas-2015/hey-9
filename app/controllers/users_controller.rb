class UsersController < ApplicationController
  include ApplicationHelper
  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    end
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
    if session[:user_id] == nil
       redirect_to "/sessions/new"
    else
      @user = current_user
      @forecast_data = forecast_data
      if @user.id != params[:id].to_i
          redirect_to "/users/#{@user.id}"
      end
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
      p @user.lat
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
      params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
