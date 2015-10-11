require 'rails_helper'

describe MessageBoard do
  context "associations" do
    before {
      @neighborhood = Neighborhood.create!(description: "Rogers Park")
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123", neighborhood: @neighborhood)
      @message_board = MessageBoard.create!(neighborhood: @neighborhood)
      @board_message = Message.create!(author: @user, messageable_type: "MessageBoard", messageable: @message_board)
    }

    it "should return the neighborhood related to this message_board" do
      expect(@message_board.neighborhood).to eq(@neighborhood)
    end

    it "should return the messages related to this message_board" do
      expect(@message_board.messages).to eq([@board_message])
    end

  end

end
