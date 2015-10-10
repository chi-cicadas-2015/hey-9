require 'rails_helper'

RSpec.describe Dog, :type => :model do
    describe 'associations' do
      before{
        @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123")
        @user2 = User.create!(username: "chris", email: "chris@chris", password: "123")
        @dog1 = Dog.create!(name: "Kira", owner: @user1)
        @dog2 = Dog.create!(name: "fluffy", owner: @user2)

        @dog_connection = DogConnection.create!(follower: @dog1, following: @dog2, relationship_status: "1")

      }

      it "returns the owner of the dog" do
        expect(@dog1.owner).to eq(@user1)
      end

      it "returns the followers of the dog" do
        expect(@dog2.followers).to eq([@dog1])
      end

      it "returns the dogs the dog is following" do
        expect(@dog1.followings).to eq([@dog2])
      end

    end
end
