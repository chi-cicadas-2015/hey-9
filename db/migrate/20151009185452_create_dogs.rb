class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.integer :owner_id, null: false
      t.string  :bio
      t.string  :profile_img
      t.timestamps null: false
    end
  end
end
