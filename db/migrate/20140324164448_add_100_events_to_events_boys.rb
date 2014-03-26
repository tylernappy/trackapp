class Add100EventsToEventsBoys < ActiveRecord::Migration
  def change
    add_column :events_boys, :boys_100_m, :boolean
    add_column :events_boys, :time_100_m, :float
    add_column :events_boys, :place_100_m, :integer
  end
end
