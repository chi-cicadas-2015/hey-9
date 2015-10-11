class Dog < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true

  # has_many :passive_connections, class_name: "DogConnection", foreign_key: :following_id
  # has_many :active_connections, class_name: "DogConnection", foreign_key: :follower_id
  has_many  :dog_connections
  # has_many :followers, through: :dog_connections, foreign_key: "following_id"
  # has_many :followings, through: :dog_connections, foreign_key: "follower_id"
  has_many :followings, through: :dog_connections, foreign_key: "follower_id"

  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

  # def followers
  #   followers = DogConnection.where(:following_id => self.id)
  #   @my_followers = []

  #   followers.each do |dog|
  #     @my_followers << dog.dog_id
  #   end
  # end

end
