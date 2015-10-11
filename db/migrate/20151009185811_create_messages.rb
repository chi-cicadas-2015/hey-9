class CreateMessages < ActiveRecord::Migration
  def change
    enable_extension 'json'
    create_table :messages do |t|
      t.integer :author_id, null: false
      t.string :messageable_type, null: false
      t.integer  :messageable_id, null: false
      t.string  :content, null: false
      t.json :location
      t.timestamps null: false
    end
  end
end
