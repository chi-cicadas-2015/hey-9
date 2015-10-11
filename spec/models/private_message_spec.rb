require 'rails_helper'

describe PrivateMessage do
  context "associations" do

    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})

      @direct_conversation = DirectConversation.create!(subject: "WE LOVE DOGS")

      @private_message = PrivateMessage.create!(user: @user, conversation: @direct_conversation, content:"I LOVE DOGS")
    }

    it "should return the author" do
      expect(@private_message.user).to eq(@user)
    end

    it "should return the conversation" do
      expect(@private_message.conversation).to eq(@direct_conversation)
    end
  end
end
