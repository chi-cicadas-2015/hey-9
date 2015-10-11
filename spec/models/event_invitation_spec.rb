require 'rails_helper'

describe EventInvitation do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
      @user2 = User.create!(username: "chris", email: "chris@chris", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
      @dog2 = Dog.create!(name: "fluffy", owner: @user2)
      @event = Event.create!(creator: @user1, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
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
