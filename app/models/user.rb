class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :direct_messages, foreign_key: "commenter_id"
  has_many :reviews, foreign_key: "reviewer_id"
  has_many :ratings, foreign_key: "rater_id"

  has_secure_password
end
