class CreateWarnings < ActiveRecord::Migration
  def change
    create_table :warnings do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :country
      t.text :date

      t.timestamps
    end
  end
end
