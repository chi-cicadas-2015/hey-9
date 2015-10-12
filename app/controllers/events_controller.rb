class EventsController < ApplicationController
  include ApplicationHelper
  before_action :authorize
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
  end

  # def show
  # end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end

  end

  # def edit
  # end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy

  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:location, :event_start, :event_end, :description)
  end

end
