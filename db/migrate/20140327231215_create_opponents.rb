class CreateOpponents < ActiveRecord::Migration
  def change
    create_table :opponents do |t|
      t.integer :school_id
      t.integer :meet_id
      t.float :score

      t.timestamps
    end
  end
end
