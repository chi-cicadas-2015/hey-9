class CreateEventInvitations < ActiveRecord::Migration
  def change
    create_table :event_invitations do |t|
      t.integer :event_id
      t.integer :invitee_id
      t.string  :rsvp_status
      t.timestamps null: false
    end
  end
end
