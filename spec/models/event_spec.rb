require 'rails_helper'

describe Event do
  context "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@larissa", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
      @dog2 = Dog.create!(name: "fluffy", owner: @user1)
      @event = Event.create!(creator: @user1, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
      @event_invitation = EventInvitation.create!(event: @event, invitee: @dog2)
      @comment = Comment.create!(commenter: @user1, commentable_type: "Event", commentable: @event, content: "I LOVE DOGS")
    }

    it "should return the creator of this event" do
        expect(@event.creator).to eq(@user1)
    end

    it "should return the invitations for this event" do
        expect(@event.event_invitations).to eq([@event_invitation])
    end

    it "should return the comments for this event" do
        expect(@event.comments).to eq([@comment])
    end

  end
end
