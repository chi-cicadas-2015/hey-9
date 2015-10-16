require 'rails_helper'

describe Event do

  it "should have a vaild factory" do
      expect(build(:event)).to be_valid
  end

  describe "associations" do
    before {
      @user1 = User.create!(username: "larissa", email: "larissa@email.com", password: "123", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
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

    describe "validations" do
      it { expect(@event).to validate_presence_of(:creator) }
      it { expect(@event).to validate_presence_of(:event_start) }
      it { expect(@event).to validate_presence_of(:event_end) }
      it { expect(@event).to validate_presence_of(:description) }
    end

  end
end
