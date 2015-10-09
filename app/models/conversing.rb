class Conversing < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :conversation, class_name: :DirectConversation
end
