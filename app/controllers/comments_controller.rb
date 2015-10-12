class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def create
    @comment= Comment.new(params)
    @comment.commenter_id = current_user.id
    if @comment.save
    end
  end

  private

  def set_comment
    if current_user
      @comment = Comment.find(params[:id])
    end
  end
end
