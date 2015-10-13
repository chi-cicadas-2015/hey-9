require 'rails_helper'

describe DogConnection do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
      @user2 = User.create!(username: "chris", email: "chris@chris", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
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
