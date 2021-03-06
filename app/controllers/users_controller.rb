class UsersController < ApplicationController
  include ApplicationHelper
  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    end
    @user = User.new
  end

  def check_messages
    if request.xhr?
      old_msg_ratio = params[:number] || 0
      new_msg_ratio = current_user.check_new_messages
      @response =
        {"new_msg_ratio" => current_user.check_new_messages,
        "new_badge" => new_msg_ratio < old_msg_ratio}
      render json: @response
    end
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

      render :show
    else

      if params[:receive_notices] == 0
        @user.receive_notices = false
      else params[:not_receive_notices] == 0
        @user.receive_notices = true
      end

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

   def sync_location
    if session[:user_id]
      if request.xhr?
       lat = params['location']['lat'].to_f
       lng = params['location']['lng'].to_f
       @user = User.find_by(id: current_user.id)
       @user.update_attributes(lat: lat, lng: lng)
      end
    end
    render nothing: true, status: 200
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password, :avatar, :phone_number)
  end
end
