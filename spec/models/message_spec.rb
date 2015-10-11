require 'rails_helper'

describe Message do

  context "associations" do

    before {
      @user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password: "123",location: {:latitude=> 41.878114,:longitude=> -87.629798})

      @message = Message.create!(author: @user, location: {:latitude=> 41.878114,:longitude=> -87.629798}, content:"I LOVE DOGS")
    }

    it "should return the author" do
      expect(@message.author).to eq(@user)
    end

  end

end
