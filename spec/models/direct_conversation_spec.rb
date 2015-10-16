require 'rails_helper'

describe DirectConversation do
  context "associations" do
    before {
      @user = User.create!(username: "chris", email: "chris@email.com", password: "password", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)
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
