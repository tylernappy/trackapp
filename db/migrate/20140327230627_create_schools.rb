class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :coach_id
      t.string :name

      t.timestamps
    end
  end
end
