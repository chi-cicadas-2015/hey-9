module ApplicationHelper
  require 'typhoeus'
  require 'json'

  def set_user_session(user)
    session[:user_id] = user.id
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
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
    @events
  end

  def find_friends
    @connection = []
    @friends = []
    current_user.dogs.each do |dog|
      @connection << dog.dog_connections
    end
    @connection.each do |connection|
      @friends << Dog.find_by(id: connection.following_id)
    end
  end

  def location_get
      location = [current_user.lat, current_user.lng]
  end

  def gen_neighborhood
    neighborhood = Geokit::Bounds.from_point_and_radius(location_get, 1)
  end

  def find_good_dogs(dog)
    @good_dogs = []
    @friends = DogConnection.where(relationship_status: 1, dog_id: dog.id).all
    @friends.each do |friend|
      @good_dogs << Dog.find_by(id: friend.following_id)
    end
    @good_dogs
  end

  def find_bad_dogs(dog)
    @bad_dogs = []
    @enemies = DogConnection.where(relationship_status: -1, dog_id: dog.id).all
    @enemies.each do |enemy|
      @bad_dogs << Dog.find_by(id: enemy.following_id)
    end
    @bad_dogs
  end

  def text_users
    neighborhood = gen_neighborhood
    @users = User.where(receive_notices: true)
  end

  def search(query)
    dogs = Dog.all
    @found_dogs = []
    dogs.each do |dog|
      if dog.name.downcase == query.downcase
        @found_dogs << dog
      end
    end
    @found_dogs
  end
end





