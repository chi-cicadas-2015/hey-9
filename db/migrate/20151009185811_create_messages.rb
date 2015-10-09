class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.string :messageable_type
      t.integer  :messageable_id
      t.string  :content
      t.timestamps null: false
    end
  end
end
