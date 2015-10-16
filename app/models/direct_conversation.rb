class DirectConversation < ActiveRecord::Base
  has_many :private_messages, foreign_key: "conversation_id"
  has_many :users, through: :private_messages

  def recipient
    @recipient
  end

  def updated
    self.private_messages.last.created_at
  end

  def participants
    # usernames = self.users.collect{|user| user.username}.uniq

    # if usernames.length == 2
    #   participants = usernames.join(' and ')
    # elsif usernames.length > 2
    #   usernames.insert(-2, 'and ')
    #   first = usernames[0..-2].join(', ')
    #   participants = first + usernames[-1]
    # end
    # participants.gsub(/#{user.username}/, 'you')

    self.users.uniq
  end
end
