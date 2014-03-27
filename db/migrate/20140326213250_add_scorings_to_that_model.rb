class AddScoringsToThatModel < ActiveRecord::Migration
  def change
    add_column :scorings, :first_relay, :integer
    add_column :scorings, :second_relay, :integer
    add_column :scorings, :third_relay, :integer

    add_column :scorings, :first_regular, :integer
    add_column :scorings, :second_regular, :integer
    add_column :scorings, :third_regular, :integer
    add_column :scorings, :fourth_regular, :integer
    add_column :scorings, :fifth_regular, :integer
    add_column :scorings, :sixth_regular, :integer
  end
end
