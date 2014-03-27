class AddTotalPointsForBoysAndGirlsToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :boys_total_points, :float
    add_column :meets, :girls_total_points, :float
  end
end
