class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p params[:session][:email]
    p params[:session][:password]
    @user = User.find_by(email: params[:session][:email])
    p @user
    if @user != nil
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end
end
