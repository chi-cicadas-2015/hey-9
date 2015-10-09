class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :message_board_id
      t.string  :content
      t.timestamps null: false
    end
  end
end
