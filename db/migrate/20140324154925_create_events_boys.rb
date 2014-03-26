class CreateEventsBoys < ActiveRecord::Migration
  def change
    create_table :events_boys do |t|
      t.boolean :boys_400_m_im
      t.boolean :boys_event_1600_m
      t.boolean :boys_event_400_m
      t.boolean :boys_event_110_m_hh
      t.boolean :boys_800_m
      t.boolean :boys_3200_m
      t.boolean :boys_200_m
      t.float :time_400_m_im
      t.float :time_1600_m
      t.float :time_400_m
      t.float :time_110_m_hh
      t.float :time_800_m
      t.float :time_3200_m
      t.float :time_200_m
      t.integer :place_400_m_im
      t.integer :place_1600_m
      t.integer :place_400_m
      t.integer :place_110_m_hh
      t.integer :place_800_m
      t.integer :place_3200_m
      t.integer :place_200_m
      t.integer :athlete_id
      t.integer :meet_id

      t.timestamps
    end
  end
end
