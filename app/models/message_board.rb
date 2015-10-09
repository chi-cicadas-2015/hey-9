class MessageBoard < ActiveRecord::Base
  belongs_to  :neighborhood
  has_many  :users, through: neighborhood
  has_many :messages, as: :messageable
end
