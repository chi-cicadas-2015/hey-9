require 'rails_helper'

describe EventInvitation do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123")
      @user2 = User.create!(username: "chris", email: "chris@chris", password: "123")
      @dog2 = Dog.create!(name: "fluffy", owner: @user2)
      @event = Event.create!(creator: @user1)
      @event_invitation = EventInvitation.create!(event: @event, invitee: @dog2)
    }

    it "should return the invitee in this invitation" do
        expect(@event_invitation.invitee).to eq(@dog2)
    end

    it "should return the event in this invitation" do
        expect(@event_invitation.event).to eq(@event)
    end
  end

end
