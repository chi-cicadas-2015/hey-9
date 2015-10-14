class MapsController < ApplicationController
  include ApplicationHelper
  def index
    @user = User.find_by(id: current_user.id)
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

      p @alphabet
      @store_addresses = store_addresses
      @store_names_display = store_names
      @store_names = store_names.to_json
      @store_lats = store_lats.to_json
      @store_lngs = store_lngs.to_json


      @store1_name = body['results'][0]['name']
      @store1 = [body['results'][0]['geometry']['location']['lat'], body['results'][0]['geometry']['location']['lng']]
       @store2_name = body['results'][1]['name']
      @store2 = [body['results'][1]['geometry']['location']['lat'], body['results'][1]['geometry']['location']['lng']]
       @store3_name = body['results'][2]['name']
      @store3 = [body['results'][2]['geometry']['location']['lat'], body['results'][2]['geometry']['location']['lng']]
    if @user.lng && @user.lat
      @location_array = [@user.lat, @user.lng]
    else
      redirect_to "/users/<%= @user.id %>"
    end

  end


end
