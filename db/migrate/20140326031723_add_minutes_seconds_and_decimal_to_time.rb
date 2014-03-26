class AddMinutesSecondsAndDecimalToTime < ActiveRecord::Migration
  def change
    remove_column :events_boys, :time_400_m_im
    remove_column :events_boys, :time_1600_m
    remove_column :events_boys, :time_400_m
    remove_column :events_boys, :time_110_m_hh
    remove_column :events_boys, :time_800_m
    remove_column :events_boys, :time_3200_m
    remove_column :events_boys, :time_200_m
    remove_column :events_boys, :time_100_m

    add_column :events_boys, :time_minutes_400_m_im, :integer
    add_column :events_boys, :time_minutes_1600_m, :integer
    add_column :events_boys, :time_minutes_400_m, :integer
    add_column :events_boys, :time_minutes_110_m_hh, :integer
    add_column :events_boys, :time_minutes_800_m, :integer
    add_column :events_boys, :time_minutes_3200_m, :integer
    add_column :events_boys, :time_minutes_200_m, :integer
    add_column :events_boys, :time_minutes_100_m, :integer

    add_column :events_boys, :time_seconds_400_m_im, :integer
    add_column :events_boys, :time_seconds_1600_m, :integer
    add_column :events_boys, :time_seconds_400_m, :integer
    add_column :events_boys, :time_seconds_110_m_hh, :integer
    add_column :events_boys, :time_seconds_800_m, :integer
    add_column :events_boys, :time_seconds_3200_m, :integer
    add_column :events_boys, :time_seconds_200_m, :integer
    add_column :events_boys, :time_seconds_100_m, :integer

    add_column :events_boys, :time_decimals_400_m_im, :integer
    add_column :events_boys, :time_decimals_1600_m, :integer
    add_column :events_boys, :time_decimals_400_m, :integer
    add_column :events_boys, :time_decimals_110_m_hh, :integer
    add_column :events_boys, :time_decimals_800_m, :integer
    add_column :events_boys, :time_decimals_3200_m, :integer
    add_column :events_boys, :time_decimals_200_m, :integer
    add_column :events_boys, :time_decimals_100_m, :integer
  end
end
