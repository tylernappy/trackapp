class Meet < ActiveRecord::Base
  belongs_to :season
  has_many :events_boys
  # has_many :events_girls


  has_many :one_hundred_meters
  has_many :eight_hundred_meter_ms
  has_many :four_hundred_hurdles_ms
  has_many :four_hundred_meter_ms
  has_many :one_hundred_meter_ms
  has_many :one_ten_hurdle_ms
  has_many :sixteen_hundred_meter_ms
  has_many :two_hundred_meter_ms
  has_many :two_mile_ms
end
