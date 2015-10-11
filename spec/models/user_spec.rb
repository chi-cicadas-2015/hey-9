require 'rails_helper'

describe User do
  context "validations" do
    it "should create a new user" do
      user_params = { username: "Mitch", email: "mitch@email.com", password: "password", password_confirmation: "password" }
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
        @neighborhood = Neighborhood.create!(description: "Rogers Park")

        @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123", neighborhood: @neighborhood)
        @event = Event.create!(creator: @user)
        @comment = Comment.create!(commenter: @user, commentable_type: "Event", commentable: @event)

        @direct_conversation = DirectConversation.create!(subject: "what up")
        @conversing = Conversing.create!(user: @user, direct_conversation: @direct_conversation)
        @conversation_message = Message.create!(author: @user, messageable_type: "DirectConversation", messageable: @direct_conversation)

        @message_board = MessageBoard.create!(neighborhood: @neighborhood)
        @board_message = Message.create!(author: @user, messageable_type: "MessageBoard", messageable: @message_board)

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

    it 'should return the messages related to this user' do
      expect(@user.messages).to eq([@conversation_message, @board_message])
    end

    it "should return the conversings related to this user" do
      expect(@user.conversings).to eq([@conversing])
    end

    it "should return the direct conversations related to this user" do
      expect(@user.direct_conversations).to eq([@direct_conversation])
    end

    it "should return the neighborhood related to this user" do
      expect(@user.neighborhood).to eq(@neighborhood)
    end

  end

end
