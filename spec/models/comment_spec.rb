require 'rails_helper'

describe Comment do
  context "associations" do
    before {
      @user = User.create!(username: "chris", email: "chris@email.com", password: "password", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
      @event = Event.create!(creator: @user, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
      @message = Message.create!(author: @user, :lat=> 41.890192,:lng=> -87.637224, content: "I LOVE DOGS")
      @event_comment = Comment.create!(commenter: @user, commentable_type: "Event", commentable: @event, content: "I LOVE DOGS")
      @message_comment = Comment.create!(commenter: @user, commentable_type: "Message", commentable: @message, content: "I LOVE DOGS")
    }

    it "should return the commenter" do
      expect(@event_comment.commenter).to eq(@user)
    end
    it "should return the event for a comment on an event" do
      expect(@event_comment.event).to eq(@event)
    end

    it "should return the message for a comment on a message" do
      expect(@message_comment.message).to eq(@message)
    end


  end
end
