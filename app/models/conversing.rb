class Conversing < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :direct_conversation, foreign_key: "conversation_id"
end
