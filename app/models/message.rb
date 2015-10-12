class Message < ActiveRecord::Base
  acts_as_mappable
  has_many :comments, as: :commentable
  belongs_to :author, class_name: :User
end
