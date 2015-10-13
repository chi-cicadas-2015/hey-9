class DirectConversationsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def index
    @user = current_user
    @direct_conversations = @user.direct_conversations.uniq
    @private_message = PrivateMessage.new
  end

  def show
    set_direct_conversation
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
end