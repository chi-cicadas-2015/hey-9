require 'rails_helper'

describe DogConnection do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123")
      @user2 = User.create!(username: "chris", email: "chris@chris", password: "123")
      @dog1 = Dog.create!(name: "Kira", owner: @user1)
      @dog2 = Dog.create!(name: "fluffy", owner: @user2)
      @dog_connection = DogConnection.create!(follower: @dog1, following: @dog2)
    }

    it "should return the follower in this connection" do
        expect(@dog_connection.follower).to eq(@dog1)
    end

    it "should return the following in this connection" do
        expect(@dog_connection.following).to eq(@dog2)
    end

  end

end
