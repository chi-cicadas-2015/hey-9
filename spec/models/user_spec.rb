require 'rails_helper'

describe User do
  context "validations" do
    it "should create a new user" do
      user_params = { username: "Mitch", email: "mitch@email.com", password: "password", password_confirmation: "password",location: {:latitude=> 41.878114,:longitude=> -87.629798}}
      expect { User.create(user_params) }.to change(User, :count).by(1)
    end

    # it 'should require a name >= 4 characters' do
    #   user.create(:name => "No", :password => "secret").should_not be_valid
    # end

    # it 'should verify the uniqueness of the name' do

    # end
  end

  context "associations" do
    before {
        @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
        @event = Event.create!(creator: @user, event_start: DateTime.now, event_end: DateTime.now, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!")
        @comment = Comment.create!(commenter: @user, commentable_type: "Event", commentable: @event, content: "I aM aNNNN INeternt commeNT")

        @direct_conversation = DirectConversation.create!(subject: "what up")
        @private_message = PrivateMessage.create!(user: @user, conversation: @direct_conversation, content: "I LOVE DOGS")

        @message = Message.create!(author: @user,location: {:latitude=> 41.878114,:longitude=> -87.629798}, content: "I LOVE DOGS")

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

  end

end
