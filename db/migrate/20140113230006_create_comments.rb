class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :warning_id
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
