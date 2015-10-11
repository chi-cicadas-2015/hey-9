require 'rails_helper'

describe Comment do
  context "associations" do
    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123")
      @event = Event.create!(creator: @user)
      @message = Message.create!(author: @user)
      @event_comment = Comment.create!(commenter: @user, commentable_type: "Event", commentable: @event)
      @message_comment = Comment.create!(commenter: @user, commentable_type: "Message", commentable: @message)
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
