require 'rails_helper'

describe EventInvitation do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@email.com", password: "123", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
      @user2 = User.create!(username: "chris", email: "chris@email.com", password: "password", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
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
