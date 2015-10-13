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
      redirect_to "/dogs/#{@dog.id}"
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

  private

  def dog_params
    p "************#{params[:avatar]}"
    params.require(:dog).permit(:name, :bio, :owner_id, :avatar)
  end
end
