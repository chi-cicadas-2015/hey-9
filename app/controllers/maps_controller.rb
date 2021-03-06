class MapsController < ApplicationController
  include ApplicationHelper
  def index
    @user = User.find_by(id: current_user.id)
     @users = User.within(2, :origin => location_get).all
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
      p @local_dogs
        @current_user_lat = @user.lat
        @current_user_lng = @user.lng

      #******stores search********


      #******** Parks Search ***************

      @location_array = [@user.lat, @user.lng]

      @alphabet = [*('a'..'z')]
      @alphabet.map! do |letter|
        letter.capitalize
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
    render :json => @data
  end

  def dog_parks
    @user = User.find_by(id: current_user.id)
    @current_user_lat = @user.lat
    @current_user_lng = @user.lng
    parksUri = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@user.lat},#{@user.lng}&radius=2000&keyword=dogparks&key=#{Rails.application.secrets.google_api_key}")
      parks_response = Net::HTTP.get_response(parksUri)
      parks_body = JSON.parse(parks_response.body)
      park_names = []
      park_lats = []
      park_lngs = []
      park_addresses = []

      parks_body['results'].each do |park|
        park_names << park['name']
        park_lats << park['geometry']['location']['lat']
        park_lngs << park['geometry']['location']['lng']
        park_addresses << park['vicinity'];
      end
      @park_names = park_names
      @park_addresses = park_addresses
      @park_lats = park_lats.to_json
      @park_lngs = park_lngs.to_json
      @alphabet = [*('a'..'z')]
      @alphabet.map! do |letter|
        letter.capitalize
      end
  end

  def pet_stores
    @user = User.find_by(id: current_user.id)
    @current_user_lat = @user.lat
    @current_user_lng = @user.lng
       url = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@user.lat},#{@user.lng}&radius=2000&keyword=pet&types=pet_store&key=#{Rails.application.secrets.google_api_key}")
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
      @store_names = store_names
      @store_lats = store_lats.to_json
      @store_lngs = store_lngs.to_json

  end

end

