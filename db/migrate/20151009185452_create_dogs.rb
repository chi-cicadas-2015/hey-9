class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string  :name, null: false
      t.integer :owner_id, null: false
      t.text  :bio
      t.timestamps null: false
    end
  end
end
