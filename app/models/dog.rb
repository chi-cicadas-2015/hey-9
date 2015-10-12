class Dog < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true

  has_many  :dog_connections
  has_many :followings, through: :dog_connections, foreign_key: "follower_id"

  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

  def self.followers(dog_id)
    followed = Dog.find_by_id(dog_id)
    connections = DogConnection.where(:following => followed)
    connections.collect{|connection| connection.dog}
  end

end

