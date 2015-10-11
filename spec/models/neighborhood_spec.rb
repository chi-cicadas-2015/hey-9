require 'rails_helper'

describe Neighborhood do
  context "associations" do
    before {
      @neighborhood = Neighborhood.create!(description: "Rogers Park")
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123", neighborhood: @neighborhood)
      @message_board = MessageBoard.create!(neighborhood: @neighborhood)
    }

    it "should return the message_board related to this neighborhood" do
      expect(@neighborhood.message_board).to eq(@message_board)
    end

    it "should return the users related to this neighborhood" do
      expect(@neighborhood.users).to eq([@user])
    end

  end

end
