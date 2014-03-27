class AddMeetIdToScorings < ActiveRecord::Migration
  def change
    add_column :scorings, :meet_id, :integer
  end
end
