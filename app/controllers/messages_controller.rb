class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index

    @presenter = {
      messages: Message.last(5),
      form: {
        action: messages_path,
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }


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
  	@message = Message.new message_params
  	@message.author = current_user
    @message.lat = current_user.lat
    @message.lng = current_user.lng
    @message.save if @message

    if request.xhr?
      render :json => Message.last(5)
    else
      redirect_to :back, notice: "Your message was successfully posted."
    end

  end

  private

  def set_message
    if current_user
      @message = Message.find(params[:id])
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

end


