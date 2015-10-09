class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.integer :neighborhood_id
      t.timestamps null: false
    end
  end
end
