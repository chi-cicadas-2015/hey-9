class MapsController < ApplicationController
  include ApplicationHelper
  def index
    @user = User.find_by(id: current_user.id)
     @users = User.within(2, :origin => location_get).all
     p @users
     @local_dogs = []
     @users_lat = []
     @users_lng = []
      @users.each do |user|
        @users_lat << user.lat
        @users_lng << user.lng
        user.dogs.each do |dog|
          @local_dogs << dog
        end
      end
      p "*********#{@user.lng}"
      # @users_lat = @users_lat.to_json
      # @users_lng = @users_lng.to_json
      url = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@user.lat},#{@user.lng}&radius=2000&keyword=pet&types=pet_store&key=AIzaSyCX0zgiH5c-ezhGHS679V2hWO7rQbenKbg")
      response = Net::HTTP.get_response(url)
      body = JSON.parse(response.body)
      store_names = []
      store_lats = []
      store_lngs = []
      store_addresses = []

      body['results'].each do |store|
        store_names << store['name']
        store_lats << store['geometry']['location']['lat']
        store_lngs << store['geometry']['location']['lng']
        store_addresses << store['vicinity'];
      end
      @alphabet = [*('a'..'z')]
      @alphabet.map! do |letter|
        letter.capitalize
      end
      @store_addresses = store_addresses
      @store_names_display = store_names
      @store_names = store_names.to_json
      @store_lats = store_lats.to_json
      @store_lngs = store_lngs.to_json

    if @user.lng && @user.lat
      @location_array = [@user.lat, @user.lng]
    else
      redirect_to "/users/<%= @user.id %>"
    end

  end

  def data
    @user = User.find_by(id: current_user.id)
    @users = User.within(2, :origin => location_get).all
    @users_lat = []
    @users_lng = []
    @users.each do |user|

      @users_lat << user.lat
      @users_lng << user.lng

    end

    @data = {
      my_lat: @user.lat,
      my_lng: @user.lng,
      users_lat: @users_lat,
      users_lng: @users_lng
    }
    p @data.to_json
    render :json => @data
  end

end

