require 'rails_helper'

describe Message do

  context "associations" do

    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123")

      @direct_conversation = DirectConversation.create!(subject: "what up")
      @conversation_message = Message.create!(author: @user, messageable_type: "DirectConversation", messageable: @direct_conversation)

      @neighborhood = Neighborhood.create!(description: "Rogers Park")
      @message_board = MessageBoard.create!(neighborhood: @neighborhood)
      @board_message = Message.create!(author: @user, messageable_type: "MessageBoard", messageable: @message_board)
    }

    it "should return the author" do
      expect(@board_message.author).to eq(@user)
    end

    it "should return the direct conversation for a conversation message" do
      expect(@conversation_message.direct_conversation).to eq(@direct_conversation)
    end

    it "should return the board for a board message" do
      expect(@board_message.message_board).to eq(@message_board)
    end

  end

end
