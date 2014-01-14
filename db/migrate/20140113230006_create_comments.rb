class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :country_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
