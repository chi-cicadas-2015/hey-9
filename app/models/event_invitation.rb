class EventInvitation < ActiveRecord::Base
  belongs_to  :event
  belongs_to  :invitee, class_name: :Dog

end
