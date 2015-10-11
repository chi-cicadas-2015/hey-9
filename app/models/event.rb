class Event < ActiveRecord::Base
  has_many :event_invitations
  has_many :comments, as: :commentable

  belongs_to  :creator, class_name: :User
end
