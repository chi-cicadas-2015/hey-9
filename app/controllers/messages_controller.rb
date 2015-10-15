class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index
    @presenter = build_presenter
    p @presenter

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
      @messages.sort!{|a,b| b.created_at <=> a.created_at}
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
    p "PARAMS:"
    logger.info(params)
    @author = User.find(params[:current_user_id].to_i)
    @message = @author.messages.build(message_params)

    @message.lat = @author.lat
    @message.lng = @author.lng
    @message.save if @message
    p "Message:"
    p @message
    if request.xhr?

      render :json => build_presenter[:messages]
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

  def build_presenter
    @presenter_messages = []
    Message.last(5).each do |message|
      message_hash = {
        content: message.content,
        author: message.author.username,
        comments: [],
        comment_form: {
          action: message_comments_path(message),
          :csrf_param => request_forgery_protection_token,
          :csrf_token => form_authenticity_token
        }
      }

      message.comments.last(3).each do |comment|
          message_hash[:comments] << { content: comment.content, commenter: comment.commenter.username }
      end

      @presenter_messages << message_hash

    end

    {
      messages: @presenter_messages,
      form: {
        action: messages_path,
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }
  end

end


