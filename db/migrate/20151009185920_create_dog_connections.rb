class CreateDogConnections < ActiveRecord::Migration
  def change
    create_table :dog_connections do |t|
      t.integer :follower_id, null: false
      t.integer :following_id, null: false
      t.integer :relationship_status, default: 1
      t.timestamps null: false
    end
  end
end
