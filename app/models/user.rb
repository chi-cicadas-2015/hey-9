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

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]

  has_secure_password

  def self.find_users(string)
    usernames = string.split(', ')
    usernames.map!{ |username|
      self.find_by_username(username)}
  end

  def check_new_messages
    convos = self.direct_conversations.uniq
    user_messages = self.private_messages.length
    total_messages = 0
    convos.each {|convo| total_messages += convo.private_messages.length}
    user_messages.fdiv(total_messages)
  end
end
