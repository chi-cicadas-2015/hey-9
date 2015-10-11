class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id, null: false
      t.json :location
      t.text  :content, null: false
      t.timestamps null: false
    end
  end
end
