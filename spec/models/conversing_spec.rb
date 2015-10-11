require 'rails_helper'

describe Conversing do
  context "associations" do
    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123")
      @direct_conversation = DirectConversation.create!(subject: "what up")
      @conversing = Conversing.create!(user: @user, direct_conversation: @direct_conversation)
    }

    it "should return the user of a conversing" do
      expect(@conversing.user).to eq(@user)
    end

    it "should return the direct conversation" do
      expect(@conversing.direct_conversation).to eq(@direct_conversation)
    end

  end

end
