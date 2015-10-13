class Dog < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true

  has_many  :dog_connections
  has_many :followings, through: :dog_connections, foreign_key: "follower_id"

  has_many :event_invitations, foreign_key: "invitee_id"

  belongs_to  :owner, class_name: :User

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },  :storage => :s3,
   :bucket => 'imageuploadstorage',
   :url => ':s3_domain_url',
   :path => "/pieces/:id/:style/:basename.:extension",
   :s3_credentials => "#{Rails.root}/config/aws.yml"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def followers
    followed = Dog.find_by_id(self.id)
    connections = DogConnection.where(:following => followed)
    connections.collect{|connection| connection.dog}
  end



end

