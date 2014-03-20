class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :year
      t.boolean :spring
      t.boolean :winter

      t.timestamps
    end
  end
end
