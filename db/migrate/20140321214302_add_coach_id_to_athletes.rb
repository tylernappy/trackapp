class AddCoachIdToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :coach_id, :integer
  end
end
