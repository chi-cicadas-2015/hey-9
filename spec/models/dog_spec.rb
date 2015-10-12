require 'rails_helper'

describe Dog do
    context "associations" do
      before {
        @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
        @user2 = User.create!(username: "chris", email: "chris@chris", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
        @dog1 = Dog.create!(name: "Kira", owner: @user1)
        @dog2 = Dog.create!(name: "fluffy", owner: @user2)
        @dog_connection = DogConnection.create!(dog: @dog1, following: @dog2)
        @dog_connection = DogConnection.create!(dog: @dog2, following: @dog1)
        # @active_connection = DogConnection.create!(dog: @dog1, following: @dog2)
        @event = Event.create!(creator: @user1, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
        @event_invitation = EventInvitation.create!(event: @event, invitee: @dog1)
      }

      it "returns the owner of the dog" do
        expect(@dog1.owner).to eq(@user1)
      end

      it "returns the followers of the dog" do
        expect(@dog1.followers).to eq([@dog2])
      end

      it "returns the dogs the dog is following" do
        expect(@dog1.followings).to eq([@dog2])
      end

      it "returns the dog's event invitations" do
        expect(@dog1.event_invitations).to eq([@event_invitation])
      end

    end

end
