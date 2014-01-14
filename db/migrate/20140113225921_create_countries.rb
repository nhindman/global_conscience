class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :tweet_id
      t.integer :info_id
      t.integer :user_id
      t.string :name
      t.integer :woeid

      t.timestamps
    end
  end
end
