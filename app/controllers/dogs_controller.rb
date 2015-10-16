class DogsController < ApplicationController
  include ApplicationHelper

  def index
     if current_user
      @forecast_data = forecast_data
      @user = current_user
      if params[:search]
        @dogs = Dog.search(params[:search]).order("created_at DESC")
      else
        @dogs = @user.dogs
      end
     else
        redirect_to "/sessions/new"
     end
  end

  def new
      if session[:user_id] == nil
        redirect_to "/sessions/new"
      end
      @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @dog = Dog.create!(dog_params)
    if @dog.save
      redirect_to "/dogs/#{@dog.id}"
    else
      render :new
    end
  end

  def show
      if session[:user_id] != nil
        @dog = Dog.find(params[:id])
        @user = User.find_by(id: @dog.owner_id)
      else
        redirect_to "/sessions/new"
      end
  end

  def update
    @user = User.find(session[:user_id])
    @dog = Dog.find(params[:id])
    if request.xhr?
      @dogs = @user.dogs
      @dogs.each do |dog|
        dog.followings << @dog
        @dog.followers << dog
      end
      p @dog.followers
    else

      if @dog.update(dog_params)
        redirect_to "/dogs/#{@dog.id}"
      else
        redirect_to "/users/#{@user.id}/dogs"
      end
    end
  end

  def delete
    @user = User.find_by(id: session[:user_id])
    @dog = Dog.find_by(id: params[:id])
    if @user.id != session[:user_id]
      redirect_to "/"
    else
      @dog.destroy
      redirect_to "/users/#{@user.id}"
    end
  end

  def sync_location
     if session[:user_id]
      if request.xhr?
       lat = params['location']['lat'].to_f
       lng = params['location']['lat'].to_f
       @user = User.find_by(id: current_user.id)
       @user.update_attributes(lat: lat, lng: lng)
       dog_id = params["id"].to_i
       render :show
      end
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :bio, :owner_id, :avatar)
  end
end
