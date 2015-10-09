class CreateDogConnections < ActiveRecord::Migration
  def change
    create_table :dog_connections do |t|
      t.integer :dog_id
      t.integer :friend_id
      t.integer :relationship_status
      t.timestamps null: false
    end
  end
end
