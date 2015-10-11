class DirectConversation < ActiveRecord::Base
  has_many  :private_messages, foreign_key: "conversation_id"
  has_many :users, through: :private_messages
end
