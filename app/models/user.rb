class User < ActiveRecord::Base
  acts_as_mappable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :private_messages
  has_many :direct_conversations, through: :private_messages, source: :conversation
  has_many :dogs, foreign_key: "owner_id"
  has_many :events, foreign_key: "creator_id"
  has_many :comments, foreign_key: "commenter_id"
  has_many :messages, foreign_key: "author_id"

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :storage => :s3,
   :bucket => 'imageuploadstorage',
   :url => ':s3_domain_url',
   :path => "/pieces/:id/:style/:basename.:extension",
   :s3_credentials => "#{Rails.root}/config/aws.yml"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  has_secure_password
end
