class CreateDirectMessages < ActiveRecord::Migration
  def change
    create_table :direct_messages do |t|
      t.integer :messager_id
      t.integer :recipient_id
      t.string  :content
      t.timestamps null: false
    end
  end
end
