class CreateEventInvitations < ActiveRecord::Migration
  def change
    create_table :event_invitations do |t|
      t.integer :event_id, null: false
      t.integer :invitee_id, null: false
      t.string  :rsvp_status, default: "pending"
      t.timestamps null: false
    end
  end
end
