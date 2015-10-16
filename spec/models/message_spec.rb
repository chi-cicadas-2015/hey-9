require 'rails_helper'

describe Message do

  context "associations" do

    before {
      @user = User.create!(username: "larissa", email: "larissa@email.com", password: "123", :lat=> 41.890192,:lng=> -87.637224, receive_notices: false)

      @message = Message.create!(author: @user, :lat=> 41.890192, :lng=> -87.637224, content:"I LOVE DOGS")
    }

    it "should return the author" do
      expect(@message.author).to eq(@user)
    end

  end

end
