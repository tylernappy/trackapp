class FixBoysEventsNames < ActiveRecord::Migration
  def change
    rename_column :events_boys, :boys_event_1600_m, :boys_1600_m
    rename_column :events_boys, :boys_event_400_m, :boys_400_m       
    rename_column :events_boys, :boys_event_110_m_hh, :boys_110_m_hh
  end
end
