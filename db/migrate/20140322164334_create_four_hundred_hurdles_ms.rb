class CreateFourHundredHurdlesMs < ActiveRecord::Migration
  def change
    create_table :four_hundred_hurdles_ms do |t|
      t.integer :meet_id
      t.integer :first_place_id
      t.integer :second_place_id
      t.integer :third_place_id
      t.integer :fourth_place_id
      t.integer :fifth_place_id
      t.integer :sixth_place_id

      t.timestamps
    end
  end
end
