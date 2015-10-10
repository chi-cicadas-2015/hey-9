require 'rails_helper'

RSpec.describe User, :type => :model do
	describe 'associations' do 
		before {
			@user = User.create!(username: "Wyeth", email: "wyeth@wyeth", password_digest: "123")
			@dog = Dog.create!(owner_id: @user.id)
			@event = Event.create!(creator_id: @user.id)
			@comment = Comment.create!(commenter_id: @user.id)
			@direct_conversation = DirectConversation.create!(subject: "what up")
			@conversing = Conversing.create!(user_id: @user.id, conversation_id: @direct_conversation.id)
		}
		it 'should return the dogs related to this user' do 
			expect(@user.dogs).to eq([@dog])
		end
 	end
end
