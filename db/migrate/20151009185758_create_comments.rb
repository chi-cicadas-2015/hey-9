class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :commentable_type
      t.integer :commentable_id
      t.integer :commenter_id
      t.string  :content
      t.timestamps null: false
    end
  end
end
