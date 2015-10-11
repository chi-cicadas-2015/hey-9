class CreateConversings < ActiveRecord::Migration
  def change
    create_table :conversings do |t|
      t.integer :user_id, null: false
      t.integer :conversation_id, null: false
    end
  end
end
