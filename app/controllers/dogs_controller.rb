class DogsController < ApplicationController
  def index

  end

  def new
    if params[:id] != session[:user_id]
      if session[:user_id] != nil
        redirect_to "/users/#{session[:user_id]}/dogs/new"
      else
        redirect_to "/sessions/new"
      end
    end
    @dog = Dog.new
  end

  def create
    @user = User.find_by(id: params[:id])
    @dog = Dog.new(name: params[:dog][:name], owner_id: @user.id, bio: params[:dog][:bio], profile_img: params[:dog][:profile_img])
    if @dog.save
      redirect_to "/users/#{@user.id}/dogs/{@dog.id}"
    else
      render :new
    end
  end

  def edit
    if params[:id] != session[:user_id]
      if session[:user_id] != nil
        redirect_to "/users/#{session[:user_id]}"
      else
        redirect_to "/sessions/new"
      end
    end
    @user = User.find(session[:user_id])
    @dog = Dog.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @dog = User.find(params[:id])
    if @dog.update_attributes(dog_params)
      redirect_to "/users/@user.id/dogs/@dog.id"
    else
      render :edit
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

  private

  def dog_params
    params.require(:dog).permit(:name, :bio, :profile_img)
  end
end
