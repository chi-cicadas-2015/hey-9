class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def create
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














