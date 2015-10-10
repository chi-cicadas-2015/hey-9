class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[user_id] = @user.id
      redirect_to "/users/#{@user.id}"
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
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}/edit"
      else
        redirect_to "/sessions/new"
      end
    end
  end

  def update
    @user = User.update(params[:user])
    if @user.save
        redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
  end

  def delete
    @user = User.find_by(id: params[:id])
    if @user != session[:user_id]
      redirect_to "/"
    else
      @user.destroy
      session.clear
      redirect_to "/"
    end
  end
end
