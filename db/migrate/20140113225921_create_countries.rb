class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :user_id
      t.string :name
      t.integer :woeid

      t.timestamps
    end
  end
end
