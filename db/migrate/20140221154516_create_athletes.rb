class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :grade
      t.integer :school_id

      t.timestamps
    end
  end
end
