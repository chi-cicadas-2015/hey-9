require 'rails_helper'

describe DirectConversation do
  context "associations" do
    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})
      @direct_conversation = DirectConversation.create!(subject: "what up")
      @private_message = PrivateMessage.create!(user: @user, conversation: @direct_conversation)
    }

    it "should return the users for this direct conversation" do
      expect(@direct_conversation.users).to include(@user)
    end

    it "should return the messages for this direct conversation" do
      expect(@direct_conversation.private_messages).to include(@private_message)
    end

  end

end
