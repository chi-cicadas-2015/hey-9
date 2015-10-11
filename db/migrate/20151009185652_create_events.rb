class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id, null: false
      t.string :location, null: false
      t.datetime  :event_start, null: false
      t.datetime :event_end, null: false
      t.text  :description, null: false
      t.timestamps null: false
    end
  end
end
