class Dog < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true

  # belongs_to :dog_connections, foreign_key: :follower_id
  has_many :passive_connections, class_name: "DogConnection", foreign_key: :following_id
  has_many :active_connections, class_name: "DogConnection", foreign_key: :follower_id
  has_many :followers, through: :passive_connections, source: :follower
  has_many :followings, through: :active_connections, source: :following

  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

end
