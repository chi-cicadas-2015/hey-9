class EventsController < ApplicationController
  include ApplicationHelper
  before_action :require_login
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find_by(id: current_user.id)
    @events = []
    if @user.lat && @user.lng
      @location = gen_neighborhood
      @users = User.within(2, :origin => location_get).all
      @users.each do |user|
        user.events.each do |event|
          @events << event
        end
      end
       @events.sort!{|a,b| a.created_at <=> b.created_at}
    end
  end

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

  def show
    @user = User.find_by(id: @event.creator_id)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy
    @event.destroy
    redirect_to current_user
  end

  private

  def set_event
    if current_user
      @event = Event.find(params[:id])
    end
  end

  def event_params
    params.require(:event).permit(:location, :event_start, :event_end, :description, :public)
  end

end
