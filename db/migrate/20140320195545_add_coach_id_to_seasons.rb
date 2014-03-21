class AddCoachIdToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :coach_id, :integer
  end
end
