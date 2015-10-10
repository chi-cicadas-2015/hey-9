require 'rails_helper'

describe User do
  context "validations" do
    let(:user) {User.new(email: "rob@email.com")}

    it {should validate_presence_of(:username) }
    it {should have_secure_password}
  end

  context "associations" do
    before {
        @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123")
        @event = Event.create!(creator: @user)
        @comment = Comment.create!(commenter: @user)
        @direct_conversation = DirectConversation.create!(subject: "what up")
        @conversing = Conversing.create!(user: @user, direct_conversation: @direct_conversation)
        @message = Message.create!(author: @user)
        @neighborhood = Neighborhood.create!(description: "Rogers Park")
        @user.update(neighborhood: @neighborhood)
        @message_board = MessageBoard.create!(neighborhood: @neighborhood)
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
      expect(@user.messages).to eq([@message])
    end

    it "should return the conversings related to this user" do
      expect(@user.conversings).to eq([@conversing])
    end

    it "should return the direct_conversations related to this user" do
      expect(@user.direct_conversations).to eq([@direct_conversation])
    end

    it "should return the neighborhood related to this user" do
      expect(@user.neighborhood).to eq(@neighborhood)
    end
    # move to neighborhood

    # it "should return the message_board related to this neighborhood" do
    #   expect(@neighborhood.message_board).to eq(@message_board)
    # end

    # it "should return the neighborhood related to this message_board" do
    #   expect(@message_board.neighborhood).to eq(@neighborhood)
    # end
  end


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
