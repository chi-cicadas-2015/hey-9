class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def create
    # if params[:message_id]
    #   @message = Message.find(params[:message_id])
    #   @message.comments.build(comment_params, user: current_user)

    # elsif params[:event_id]
    #   @event = Event.find(params[:event_id])
    #   @event.comments.build(comment_params, user: current_user)
    # end

    @comment = @commentable.comments.new comment_params
    @comment.commenter = current_user
    @comment.save
    redirect_to :back, notice: "Your comment was successfully posted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end














