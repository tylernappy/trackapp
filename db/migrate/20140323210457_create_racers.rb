class CreateRacers < ActiveRecord::Migration
  def change
    create_table :racers do |t|
      t.integer :athlete_id
      t.string :eight_hundred_meter_m_id_integer

      t.timestamps
    end
  end
end
