class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :event, foreign_key: :commentable_id
  belongs_to :message, foreign_key: :commentable_id

  belongs_to :commentable, polymorphic: true

end
