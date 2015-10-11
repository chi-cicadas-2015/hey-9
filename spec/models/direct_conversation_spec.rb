require 'rails_helper'

describe DirectConversation do
  context "associations" do
    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123")
      @direct_conversation = DirectConversation.create!(subject: "what up")
      @conversing = Conversing.create!(user: @user, direct_conversation: @direct_conversation)
      @conversation_message = Message.create!(author: @user, messageable_type: "DirectConversation", messageable: @direct_conversation)
    }

    it "should return the conversings for this direct conversation" do
      expect(@direct_conversation.conversings).to eq([@conversing])
    end

    it "should return the messages for this direct conversation" do
      expect(@direct_conversation.messages).to eq([@conversation_message])
    end

  end

end
