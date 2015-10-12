class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index
    @user = current_user
    if @user.lat && @user.lng
      @messages = []
      @location = gen_neighborhood
      @users = User.within(2, :origin => location_get).all
      @users.each do |user|
        user.messages.each do |message|
          @messages << message
        end
      end
      @messages.sort!{|a,b| a.created_at <=> b.created_at}
      @messages
    end
  end

  def show
  	set_message
  end

  def new
  	@message = Message.new
  end

  def create
  	@message= Message.new(params)
  	@message.author_id = current_user.id
    if @message.save
    end
  end

  private

  def set_message
    if current_user
      @message = Message.find(params[:id])
    end
  end

end


