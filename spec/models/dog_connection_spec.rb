require 'rails_helper'

describe DogConnection do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@email.com", password: "123", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
      @user2 = User.create!(username: "chris", email: "chris@email.com", password: "password", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
      @dog1 = Dog.create!(name: "Kira", owner: @user1)
      @dog2 = Dog.create!(name: "fluffy", owner: @user2)
      @dog_connection = DogConnection.create!(dog: @dog1, following: @dog2)}

    it "should return the follower dog in this connection" do
        expect(@dog_connection.dog).to eq(@dog1)
    end

    it "should return the followed dog in this connection" do
        expect(@dog_connection.following).to eq(@dog2)
    end

  end

end
