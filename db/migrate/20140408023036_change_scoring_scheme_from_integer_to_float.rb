class ChangeScoringSchemeFromIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :meets, :first_relay, :float
    change_column :meets, :second_relay, :float
    change_column :meets, :third_relay, :float

    change_column :meets, :first_regular, :float
    change_column :meets, :second_regular, :float
    change_column :meets, :third_regular, :float
    change_column :meets, :fourth_regular, :float
    change_column :meets, :fifth_regular, :float
    change_column :meets, :sixth_regular, :float
  end
end
