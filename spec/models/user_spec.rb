require 'rails_helper'

describe User do
  context "validations" do
    it "should create a new user" do
      user_params = { username: "Mitch", email: "mitch@email.com", password: "password", password_confirmation: "password", :lat=> 41.890192,:lng=> -87.637224}
      expect { User.create(user_params) }.to change(User, :count).by(1)
    end
  end

  context "associations" do
    before {
        @user = User.create!(username: "larissa", email: "larissa@email.com", password: "123", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
        @event = Event.create!(creator: @user, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
        @comment = Comment.create!(commenter: @user, commentable_type: "Event", commentable: @event, content: "I aM aNNNN INeternt commeNT")

        @direct_conversation = DirectConversation.create!(subject: "what up")
        @private_message = PrivateMessage.create!(user: @user, conversation: @direct_conversation, content: "I LOVE DOGS")

        @message = Message.create!(author: @user, :lat=> 41.890192, :lng=> -87.637224, content: "I LOVE DOGS")

        @dog = Dog.create!(owner: @user, name: "Leila")
    }

    it "should return the dogs related to this user" do
      expect(@user.dogs).to eq([@dog])
    end

    it "should return the events related to this user" do
      expect(@user.events).to eq([@event])
    end

    it "should return the comments related to this user" do
      expect(@user.comments).to eq([@comment])
    end

    it 'should return the public messages related to this user' do
      expect(@user.messages).to eq([@message])
    end

    it "should return the private messages related to this user" do
      expect(@user.private_messages).to eq([@private_message])
    end

    it "should return the direct conversations related to this user" do
      expect(@user.direct_conversations).to eq([@direct_conversation])
    end

    it "should have a vaild factory" do
      expect(build(:user)).to be_valid
    end

  end

end
