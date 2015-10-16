class Dog < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true

  has_many  :dog_connections
  has_many :followings, through: :dog_connections, foreign_key: "follower_id"

  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]

  def followers
    followed = Dog.find_by_id(self.id)
    connections = DogConnection.where(:following => followed)
    connections.collect{|connection| connection.dog}
  end

   def find_good_dogs
    @good_dogs = []
    @friends = DogConnection.where(relationship_status: 1, dog_id: self.id).all
    @friends.each do |friend|
      @good_dogs << Dog.find_by(id: friend.following_id)
    end
    @good_dogs
   end

  def find_bad_dogs()
    @bad_dogs = []
    @enemies = DogConnection.where(relationship_status: -1, dog_id: self.id).all
    @enemies.each do |enemy|
      @bad_dogs << Dog.find_by(id: enemy.following_id)
    end
    @bad_dogs
  end

end

