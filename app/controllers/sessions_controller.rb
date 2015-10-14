class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user != nil
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end

  def sync_location
    if request.xhr?
      p "yoooooooooo"
    end
  end
end
