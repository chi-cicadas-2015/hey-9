class CreateConversings < ActiveRecord::Migration
  def change
    create_table :conversings do |t|
      t.integer :user_id
      t.integer :conversation_id
    end
  end
end
