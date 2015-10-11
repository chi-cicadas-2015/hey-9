class UsersController < ApplicationController
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
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}"
      else
        redirect_to "/sessions/new"
      end
    end
  end

  def edit
    if params[:id] != session[:user_id]
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}/edit"
      else
        redirect_to "/sessions/new"
      end
    end
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        redirect_to "/users/#{@user.id}"
    else
      render :edit
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
