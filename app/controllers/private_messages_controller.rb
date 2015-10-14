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
    if @private_message.save
      if request.xhr?
        render :partial => 'private_messages/private_message', :layout => false, locals: {message: @private_message}
      else
        redirect_to :back
      end
    else
      if request.xhr?
        status 422
      else
        redirect_to :back
      end
    end
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