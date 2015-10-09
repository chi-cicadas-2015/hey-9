class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.datetime  :event_time
      t.string  :description
      t.timestamps null: false
    end
  end
end
