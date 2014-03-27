class Meet < ActiveRecord::Base
  belongs_to :season
  has_many :events_boys
  has_one :scoring
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

  def self.calculate_total_points meet, events
    total_points = 0
    events.each do |event|
      event.first.attributes.each_pair do |key, value|
        if key.split("_").first == "place" && value.nil? == false
          case value
          when "No Place"
            points = 0
          when "1"
            points = meet.first_regular
          when "2"
            points = meet.second_regular
          when "3"
            points = meet.third_regular
          when "4"
            points = meet.fouth_regular
          when "5"
            points = meet.fifth_regular
          when "6"
            points = meet.sixth_regular
          end
          total_points += points
        end 
      end
    end
    if events.first.table_name == "events_boys"
      meet.boys_total_points = total_points
    elsif events.first.table_name == "events_girls"
      meet.girls_total_points = total_points
    end
  end

  def self.hello
    puts "hello"
  end
end
