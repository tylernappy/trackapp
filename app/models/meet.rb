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

  has_many :opponents

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
            points = meet.fourth_regular
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

  def self.update_team_scores meet
    opponents = meet.opponents
    
    #four hundred hurdles
    four_hundred_hurdles_m = meet.four_hundred_hurdles_ms.first.attributes
    one_hundred_meter_m = meet.one_hundred_meter_ms.first.attributes
    sixteen_hundred_meter_m = meet.sixteen_hundred_meter_ms.first.attributes
    four_hundred_meter_m = meet.four_hundred_meter_ms.first.attributes
    eight_hundred_meter_m = meet.eight_hundred_meter_ms.first.attributes
    one_ten_hurdle_m = meet.one_ten_hurdle_ms.first.attributes
    two_mile_m = meet.two_mile_ms.first.attributes
    two_hundred_meter_m = meet.two_hundred_meter_ms.first.attributes
    opponents.each do |opponent|
      points = 0
      points = self.determine_points(meet, four_hundred_hurdles_m, opponent, points)
      points = self.determine_points(meet, one_hundred_meter_m, opponent, points)
      points = self.determine_points(meet, sixteen_hundred_meter_m, opponent, points)
      points = self.determine_points(meet, four_hundred_meter_m, opponent, points)
      points = self.determine_points(meet, one_ten_hurdle_m, opponent, points)
      points = self.determine_points(meet, eight_hundred_meter_m, opponent, points)
      points = self.determine_points(meet, two_mile_m, opponent, points)
      points = self.determine_points(meet, two_hundred_meter_m, opponent, points)
      opponent.score = points
      opponent.save
    end
  end

  def self.determine_points meet, event, opponent, points
    if event["first_place_id"] == opponent.id
      points += meet.first_regular
    end
    if event["second_place_id"] == opponent.id
      points += meet.second_regular
    end
    if event["third_place_id"] == opponent.id
      points += meet.third_regular
    end
    if event["fourth_place_id"] == opponent.id
      points += meet.fourth_regular
    end
    if event["fifth_place_id"] == opponent.id
      points += meet.fifth_regular
    end
    if event["sixth_place_id"] == opponent.id
      points += meet.sixth_regular
    end
    return points
  end




  def self.hello
    puts "hello"
  end
end
