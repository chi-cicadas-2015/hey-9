class Event < ActiveRecord::Base
  acts_as_mappable
  
  has_many :event_invitations
  has_many :comments, as: :commentable
  has_many :invitees, through: :event_invitations, foreign_key: "invitee_id"

  belongs_to  :creator, class_name: :User

  validates :creator, :event_start, :event_end, :description, presence: true
end
