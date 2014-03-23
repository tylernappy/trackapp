class AddBoysAndGirlsToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :boy, :boolean
    add_column :athletes, :girl, :boolean
  end
end
