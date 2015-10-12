class Events::CommentsController < CommentsController
  before_action :set_commentable

  private

  private

  def set_commentable
    @commentable = Event.find(params[:event_id])
  end
end