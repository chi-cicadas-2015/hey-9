class EventsController < ApplicationController
  # before_action :authenticate

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end


end
