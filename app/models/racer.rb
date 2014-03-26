class Racer < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :eight_hundred_meter_m
end
