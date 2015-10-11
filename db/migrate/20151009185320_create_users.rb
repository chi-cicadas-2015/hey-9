class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'json'
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.json  :location, null: false
      t.boolean  :receive_notices
      t.timestamps null: false
    end
  end
end
