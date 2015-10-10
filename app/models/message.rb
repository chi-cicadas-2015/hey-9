class Message < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :author, class_name: :User
  belongs_to :direct_conversation, foreign_key: :messageable_id
  belongs_to :message_board, foreign_key: :messageable_id

  belongs_to :messageable, polymorphic: true

end
