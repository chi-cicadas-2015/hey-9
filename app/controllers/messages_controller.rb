class MessagesController < ApplicationController

  def index
    # @current_user = current_user
    @messages = Message.all
  end

end
