class DogsController < ApplicationController
  def index
     if session[:user_id] != nil
        @user = User.find(session[:user_id])
        @dogs = @user.dogs
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
      redirect_to "/dogs/{@dog.id}"
    else
      render :new
    end
  end

  def show
      if session[:user_id] != nil
        @dog = Dog.find(params[:id])
      else
        redirect_to "/sessions/new"
      end
  end

  def edit
      if session[:user_id] != nil
        @user = User.find(session[:user_id])
        @dog = Dog.find(params[:id])
      else
        redirect_to "/sessions/new"
      end

  end

  def update
    @user = User.find(session[:user_id])
    @dog = User.find(params[:id])
    if @dog.update_attributes(dog_params)
      redirect_to "/dogs/#{@dog.id}"
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
    params.require(:dog).permit(:name, :bio, :profile_img, :owner_id)
  end
end