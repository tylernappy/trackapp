class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.date :date
      t.string :name
      t.string :location
      t.integer :season_id

      t.timestamps
    end
  end
end
