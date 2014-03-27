class DeleteScoringsTableAndAddEverythingToMeets < ActiveRecord::Migration
  def change
    drop_table :scorings

    add_column :meets, :first_relay, :integer
    add_column :meets, :second_relay, :integer
    add_column :meets, :third_relay, :integer

    add_column :meets, :first_regular, :integer
    add_column :meets, :second_regular, :integer
    add_column :meets, :third_regular, :integer
    add_column :meets, :fourth_regular, :integer
    add_column :meets, :fifth_regular, :integer
    add_column :meets, :sixth_regular, :integer
  end
end
