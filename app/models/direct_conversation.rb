class DirectConversation < ActiveRecord::Base
  has_many  :conversings, foreign_key: "conversation_id"

  has_many :messages, as: :messageable
end
