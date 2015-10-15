class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index

    @presenter_messages = []
    Message.last(5).each do |message|
      message_hash = {}
      comments = []
      message.comments.last(3).each do |comment|
        comment_hash = { comment: comment, commenter: comment.commenter.username }
        comments << comment_hash

        comments_hash = {
          comments: comments,
          comment_form: {
            action: message_comments_path(comment.message),
            :csrf_param => request_forgery_protection_token,
            :csrf_token => form_authenticity_token
            }
        }
      end

      message_hash = {
        message: message,
        author: message.author.username,
        comments: comments
      }

      p "MESSAGE HASH:"
      p message_hash
      @presenter_messages << message_hash
    end

    @presenter = {
      messages: @presenter_messages,
      form: {
        action: messages_path,
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }

    p "PRESENTER:"
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

      data = []
      Message.last(5).each do |message|
        message_hash = { message: message, author: message.author.username, comments: message.comments }
        data << message_hash
      end

      render :json => data
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


