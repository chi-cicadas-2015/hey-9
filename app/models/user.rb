class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :conversings
  has_many :direct_conversations, through: :conversings
  has_many :dogs, foreign_key: "owner_id"
  has_many :events, foreign_key: "creator_id"
  has_many :comments, foreign_key: "commenter_id"
  has_many :messages, foreign_key: "author_id"

  belongs_to  :neighborhood

  has_secure_password
end