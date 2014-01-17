class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :warnings_id
      t.string :username
      t.string :title

      t.timestamps
    end
  end
end
