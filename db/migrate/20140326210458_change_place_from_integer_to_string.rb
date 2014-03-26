class ChangePlaceFromIntegerToString < ActiveRecord::Migration
  def change
    remove_column :events_boys, :place_400_m_im
    remove_column :events_boys, :place_1600_m
    remove_column :events_boys, :place_100_m
    remove_column :events_boys, :place_400_m
    remove_column :events_boys, :place_110_m_hh
    remove_column :events_boys, :place_800_m
    remove_column :events_boys, :place_3200_m
    remove_column :events_boys, :place_200_m

    add_column :events_boys, :place_400_m_im, :string
    add_column :events_boys, :place_1600_m, :string
    add_column :events_boys, :place_100_m, :string
    add_column :events_boys, :place_400_m, :string
    add_column :events_boys, :place_110_m_hh, :string
    add_column :events_boys, :place_800_m, :string
    add_column :events_boys, :place_3200_m, :string
    add_column :events_boys, :place_200_m, :string
  end
end
