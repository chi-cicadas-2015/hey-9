class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.string  :location
      t.integer :neighborhood_id
      t.boolean  :receive_notices
      t.timestamps null: false
    end
  end
end
