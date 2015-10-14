module ApplicationHelper
  require 'typhoeus'
  require 'json'

  def set_user_session(user)
    session[:user_id] = user.id
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to new_session_path unless current_user
  end

  def forecast_data
    key = Rails.application.secrets.dark_sky_key
    response = Typhoeus::Request.get("https://api.forecast.io/forecast/#{key}/#{current_user.lat},#{current_user.lng}")
    JSON.parse(response.body) if response.code == 200
  end

  def check_friend_status?(follow_dog)
    @user = User.find(current_user.id)
    @users_dogs = @user.dogs
    found = false

    @users_dogs.each do |dog|
      dog.followings.each do |following|
        if following.id == follow_dog.id
          found = true
        end
      end
    end

    return found
  end

  def dog_events(dog_collection)
    @events = []
    dog_collection.each do |dog|
      dog.event_invitations.each do |event|
        found_event = Event.find(event.event_id)
        if found_event
          @events << found_event
        end
      end
    end

    return @events
  end

  def convert_time(time_num)
    hour = (time_num / 1000000) % 100
    minute = (time_num / 10000) % 100
    second = (time_num / 100) % 100
    millisecond = (time_num % 100) * 10

    time = "#{hour}:#{minute}:#{second}"
  end
end





