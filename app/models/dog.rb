class Dog < ActiveRecord::Base
  validates :owner_id, presence: true

  has_many :followings, class_name: :DogConnection
  has_many :followers, class_name: :DogConnection
  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

end
