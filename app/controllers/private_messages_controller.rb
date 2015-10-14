class PrivateMessagesController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def show
    set_private_message
  end

  def create
    @private_message = PrivateMessage.new private_message_params
    @private_message.user = current_user
    @convo = DirectConversation.find(params[:direct_conversation_id])
    @convo.private_messages << @private_message
    @private_message.save if @private_message
    redirect_to :back
  end

  private

  def set_private_message
    if current_user
      @private_message = PrivateMessage.find(params[:id])
    end
  end

  def private_message_params
    params.require(:private_message).permit(:content)
  end
end