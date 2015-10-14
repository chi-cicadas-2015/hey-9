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

  has_secure_password


  def self.find_users(string)
    usernames = string.split(', ')
    usernames.map!{ |username|
      self.find_by_username(username)}
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :location, :receive_notices)
  end
end
