class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :require_login

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: "Your comment was successfully posted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end


  # def new
  #   @comment = Comment.new
  #   respond_to do |format|
  #       format.html { redirect_to film_path(@film) }
  #       format.js
  #   end
  # end

  # def create
  #   @message = Message.find(params[:])
  #   @comment= Comment.new(params)
  #   @comment.commenter_id = current_user.id
  #   if @comment.save
  #   end
  # end

  # def create
  #   @film = Film.find(params[:film_id])
  #   @review = @film.reviews.find(params[:review_id])
  #   @comment = @review.comments.build(comment_params)

  #   if @comment.save
  #     respond_to do |format|
  #         format.html { redirect_to film_path(@film) }
  #         format.js
  #     end
  #   else
  #     head 500
  #   end

  # end













