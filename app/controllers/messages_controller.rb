class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index
    # @current_user = current_user
    @messages = Message.all
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


