require 'rails_helper'

describe Event do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123")
      @user2 = User.create!(username: "chris", email: "chris@chris", password: "123")
      @dog2 = Dog.create!(name: "fluffy", owner: @user2)
      @event = Event.create!(creator: @user1)
      @event_invitation = EventInvitation.create!(event: @event, invitee: @dog2)
      @comment = Comment.create!(commenter: @user2, commentable_type: "Event", commentable: @event)
    }

    it "should return the invitations for this event" do
        expect(@event.event_invitations).to eq([@event_invitation])
    end

    it "should return the comments for this event" do
        expect(@event.comments).to eq([@comment])
    end

    it "should return the creator of this invitation" do
        expect(@event.creator).to eq(@user1)
    end

  end
end
