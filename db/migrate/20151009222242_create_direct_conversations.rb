class CreateDirectConversations < ActiveRecord::Migration
  def change
    create_table :direct_conversations do |t|
      t.string  :subject
      t.timestamps null: false
    end
  end
end
