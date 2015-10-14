class EventsController < ApplicationController
  include ApplicationHelper
  require 'net/https'
  require 'open-uri'
  before_action :require_login
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find_by(id: current_user.id)
    @events = []
    if @user.lat && @user.lng
      p @user
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
    # p "*********#{params['event']['location']}"

    location_event = params['event']['location'].gsub(" ", "+")
      url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_event}&key=AIzaSyDj8b8ELTA9Zq9pW7IY1L4TSUX0PClr06M")
      response = Net::HTTP.get_response(url)
      # p  response.body
      # p response.body["results"]
      body = JSON.parse(response.body)
      lat = body['results'][0]["geometry"]["location"]["lat"]
      lng = body['results'][0]["geometry"]["location"]["lng"]
      @event = current_user.events.new(event_params)
      @event.update_attributes(:lat => lat, :lng => lng)
      p @event
    if @event.save
      "*********#{@event.lat}"
      redirect_to @event
    else
      render :new
    end

  end

  def show
    @event = Event.find_by(id: params[:id])
    @user = User.find_by(id: @event.creator_id)

    p "*******#{@event.lat}"
    @location = [@event.lat, @event.lng]
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

  def event_data

  end

  private

  def set_event
    if current_user
      @event = Event.find(params[:id])
    end
  end

  def event_params
    params.require(:event).permit(:location, :event_start, :event_end, :description)
  end

end
