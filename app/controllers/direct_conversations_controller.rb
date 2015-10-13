class DirectConversationsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index
    @user = current_user
    @direct_conversations = @user.direct_conversations.order("created_at desc").uniq
    @private_message = PrivateMessage.new
  end

  def show
    set_direct_conversation
  end

  def new
    @direct_conversation = DirectConversation.new
  end

  def create
    @direct_conversation = DirectConversation.new(direct_conversation_params)
    recipient_user = User.find_by_username(recipient_params[:recipient])
    add_recipient = recipient_user.private_messages.new(conversation: @direct_conversation)
    private_message = current_user.private_messages.new( private_message_params.merge(conversation: @direct_conversation))
    add_recipient.save
    private_message.save
    redirect_to :back
  end

  private

  def set_direct_conversation
    if current_user
      @direct_conversation = DirectConversation.find(params[:id])
    end
  end

  def direct_conversation_params
    params.require(:direct_conversation).permit(:subject)
  end

  def recipient_params
    params.require(:direct_conversation).permit(:recipient)
  end

  def private_message_params
    params.require(:direct_conversation).require(:private_message).permit(:content)
  end

end