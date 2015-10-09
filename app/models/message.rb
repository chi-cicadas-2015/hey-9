class Message < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :author, class_name: :User
  belongs_to :direct_conversation
  belongs_to :message_board

  belongs_to :messageable, polymorphic: true

end
