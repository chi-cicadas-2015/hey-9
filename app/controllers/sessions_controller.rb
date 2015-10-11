class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end
end
