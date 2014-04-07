class AddTiesToAllBoysEvents < ActiveRecord::Migration
  def change
    #800
    add_column :eight_hundred_meter_ms, :first_place_tie_two_id, :integer
    add_column :eight_hundred_meter_ms, :first_place_tie_three_id, :integer
    add_column :eight_hundred_meter_ms, :first_place_tie_four_id, :integer
    add_column :eight_hundred_meter_ms, :first_place_tie_five_id, :integer
    add_column :eight_hundred_meter_ms, :first_place_tie_six_id, :integer

    add_column :eight_hundred_meter_ms, :second_place_tie_two_id, :integer
    add_column :eight_hundred_meter_ms, :second_place_tie_three_id, :integer
    add_column :eight_hundred_meter_ms, :second_place_tie_four_id, :integer
    add_column :eight_hundred_meter_ms, :second_place_tie_five_id, :integer

    add_column :eight_hundred_meter_ms, :third_place_tie_two_id, :integer
    add_column :eight_hundred_meter_ms, :third_place_tie_three_id, :integer
    add_column :eight_hundred_meter_ms, :third_place_tie_four_id, :integer

    add_column :eight_hundred_meter_ms, :fourth_place_tie_two_id, :integer
    add_column :eight_hundred_meter_ms, :fourth_place_tie_three_id, :integer

    add_column :eight_hundred_meter_ms, :fifth_place_tie_two_id, :integer

    #400 HH
    add_column :four_hundred_hurdles_ms, :first_place_tie_two_id, :integer
    add_column :four_hundred_hurdles_ms, :first_place_tie_three_id, :integer
    add_column :four_hundred_hurdles_ms, :first_place_tie_four_id, :integer
    add_column :four_hundred_hurdles_ms, :first_place_tie_five_id, :integer
    add_column :four_hundred_hurdles_ms, :first_place_tie_six_id, :integer

    add_column :four_hundred_hurdles_ms, :second_place_tie_two_id, :integer
    add_column :four_hundred_hurdles_ms, :second_place_tie_three_id, :integer
    add_column :four_hundred_hurdles_ms, :second_place_tie_four_id, :integer
    add_column :four_hundred_hurdles_ms, :second_place_tie_five_id, :integer

    add_column :four_hundred_hurdles_ms, :third_place_tie_two_id, :integer
    add_column :four_hundred_hurdles_ms, :third_place_tie_three_id, :integer
    add_column :four_hundred_hurdles_ms, :third_place_tie_four_id, :integer

    add_column :four_hundred_hurdles_ms, :fourth_place_tie_two_id, :integer
    add_column :four_hundred_hurdles_ms, :fourth_place_tie_three_id, :integer

    add_column :four_hundred_hurdles_ms, :fifth_place_tie_two_id, :integer

    #400 
    add_column :four_hundred_meter_ms, :first_place_tie_two_id, :integer
    add_column :four_hundred_meter_ms, :first_place_tie_three_id, :integer
    add_column :four_hundred_meter_ms, :first_place_tie_four_id, :integer
    add_column :four_hundred_meter_ms, :first_place_tie_five_id, :integer
    add_column :four_hundred_meter_ms, :first_place_tie_six_id, :integer

    add_column :four_hundred_meter_ms, :second_place_tie_two_id, :integer
    add_column :four_hundred_meter_ms, :second_place_tie_three_id, :integer
    add_column :four_hundred_meter_ms, :second_place_tie_four_id, :integer
    add_column :four_hundred_meter_ms, :second_place_tie_five_id, :integer

    add_column :four_hundred_meter_ms, :third_place_tie_two_id, :integer
    add_column :four_hundred_meter_ms, :third_place_tie_three_id, :integer
    add_column :four_hundred_meter_ms, :third_place_tie_four_id, :integer

    add_column :four_hundred_meter_ms, :fourth_place_tie_two_id, :integer
    add_column :four_hundred_meter_ms, :fourth_place_tie_three_id, :integer

    add_column :four_hundred_meter_ms, :fifth_place_tie_two_id, :integer

    #100
    add_column :one_hundred_meter_ms, :first_place_tie_two_id, :integer
    add_column :one_hundred_meter_ms, :first_place_tie_three_id, :integer
    add_column :one_hundred_meter_ms, :first_place_tie_four_id, :integer
    add_column :one_hundred_meter_ms, :first_place_tie_five_id, :integer
    add_column :one_hundred_meter_ms, :first_place_tie_six_id, :integer

    add_column :one_hundred_meter_ms, :second_place_tie_two_id, :integer
    add_column :one_hundred_meter_ms, :second_place_tie_three_id, :integer
    add_column :one_hundred_meter_ms, :second_place_tie_four_id, :integer
    add_column :one_hundred_meter_ms, :second_place_tie_five_id, :integer

    add_column :one_hundred_meter_ms, :third_place_tie_two_id, :integer
    add_column :one_hundred_meter_ms, :third_place_tie_three_id, :integer
    add_column :one_hundred_meter_ms, :third_place_tie_four_id, :integer

    add_column :one_hundred_meter_ms, :fourth_place_tie_two_id, :integer
    add_column :one_hundred_meter_ms, :fourth_place_tie_three_id, :integer

    add_column :one_hundred_meter_ms, :fifth_place_tie_two_id, :integer

    #110 HH
    add_column :one_ten_hurdle_ms, :first_place_tie_two_id, :integer
    add_column :one_ten_hurdle_ms, :first_place_tie_three_id, :integer
    add_column :one_ten_hurdle_ms, :first_place_tie_four_id, :integer
    add_column :one_ten_hurdle_ms, :first_place_tie_five_id, :integer
    add_column :one_ten_hurdle_ms, :first_place_tie_six_id, :integer

    add_column :one_ten_hurdle_ms, :second_place_tie_two_id, :integer
    add_column :one_ten_hurdle_ms, :second_place_tie_three_id, :integer
    add_column :one_ten_hurdle_ms, :second_place_tie_four_id, :integer
    add_column :one_ten_hurdle_ms, :second_place_tie_five_id, :integer

    add_column :one_ten_hurdle_ms, :third_place_tie_two_id, :integer
    add_column :one_ten_hurdle_ms, :third_place_tie_three_id, :integer
    add_column :one_ten_hurdle_ms, :third_place_tie_four_id, :integer

    add_column :one_ten_hurdle_ms, :fourth_place_tie_two_id, :integer
    add_column :one_ten_hurdle_ms, :fourth_place_tie_three_id, :integer

    add_column :one_ten_hurdle_ms, :fifth_place_tie_two_id, :integer

    #1600
    add_column :sixteen_hundred_meter_ms, :first_place_tie_two_id, :integer
    add_column :sixteen_hundred_meter_ms, :first_place_tie_three_id, :integer
    add_column :sixteen_hundred_meter_ms, :first_place_tie_four_id, :integer
    add_column :sixteen_hundred_meter_ms, :first_place_tie_five_id, :integer
    add_column :sixteen_hundred_meter_ms, :first_place_tie_six_id, :integer

    add_column :sixteen_hundred_meter_ms, :second_place_tie_two_id, :integer
    add_column :sixteen_hundred_meter_ms, :second_place_tie_three_id, :integer
    add_column :sixteen_hundred_meter_ms, :second_place_tie_four_id, :integer
    add_column :sixteen_hundred_meter_ms, :second_place_tie_five_id, :integer

    add_column :sixteen_hundred_meter_ms, :third_place_tie_two_id, :integer
    add_column :sixteen_hundred_meter_ms, :third_place_tie_three_id, :integer
    add_column :sixteen_hundred_meter_ms, :third_place_tie_four_id, :integer

    add_column :sixteen_hundred_meter_ms, :fourth_place_tie_two_id, :integer
    add_column :sixteen_hundred_meter_ms, :fourth_place_tie_three_id, :integer

    add_column :sixteen_hundred_meter_ms, :fifth_place_tie_two_id, :integer

    #200
    add_column :two_hundred_meter_ms, :first_place_tie_two_id, :integer
    add_column :two_hundred_meter_ms, :first_place_tie_three_id, :integer
    add_column :two_hundred_meter_ms, :first_place_tie_four_id, :integer
    add_column :two_hundred_meter_ms, :first_place_tie_five_id, :integer
    add_column :two_hundred_meter_ms, :first_place_tie_six_id, :integer

    add_column :two_hundred_meter_ms, :second_place_tie_two_id, :integer
    add_column :two_hundred_meter_ms, :second_place_tie_three_id, :integer
    add_column :two_hundred_meter_ms, :second_place_tie_four_id, :integer
    add_column :two_hundred_meter_ms, :second_place_tie_five_id, :integer

    add_column :two_hundred_meter_ms, :third_place_tie_two_id, :integer
    add_column :two_hundred_meter_ms, :third_place_tie_three_id, :integer
    add_column :two_hundred_meter_ms, :third_place_tie_four_id, :integer

    add_column :two_hundred_meter_ms, :fourth_place_tie_two_id, :integer
    add_column :two_hundred_meter_ms, :fourth_place_tie_three_id, :integer

    add_column :two_hundred_meter_ms, :fifth_place_tie_two_id, :integer

    #3200
    add_column :two_mile_ms, :first_place_tie_two_id, :integer
    add_column :two_mile_ms, :first_place_tie_three_id, :integer
    add_column :two_mile_ms, :first_place_tie_four_id, :integer
    add_column :two_mile_ms, :first_place_tie_five_id, :integer
    add_column :two_mile_ms, :first_place_tie_six_id, :integer

    add_column :two_mile_ms, :second_place_tie_two_id, :integer
    add_column :two_mile_ms, :second_place_tie_three_id, :integer
    add_column :two_mile_ms, :second_place_tie_four_id, :integer
    add_column :two_mile_ms, :second_place_tie_five_id, :integer

    add_column :two_mile_ms, :third_place_tie_two_id, :integer
    add_column :two_mile_ms, :third_place_tie_three_id, :integer
    add_column :two_mile_ms, :third_place_tie_four_id, :integer

    add_column :two_mile_ms, :fourth_place_tie_two_id, :integer
    add_column :two_mile_ms, :fourth_place_tie_three_id, :integer

    add_column :two_mile_ms, :fifth_place_tie_two_id, :integer
  end
end
