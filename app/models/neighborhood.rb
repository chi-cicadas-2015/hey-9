class Neighborhood < ActiveRecord::Base
  has_one :message_board
  has_many  :users
end
