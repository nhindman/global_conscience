class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :body
      t.string :country


      t.timestamps
    end
  end
end
