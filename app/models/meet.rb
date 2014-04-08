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
          when "Did Not Run Yet"
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
    tie_points = self.determine_ties(meet, four_hundred_hurdles_m, one_hundred_meter_m, sixteen_hundred_meter_m, four_hundred_meter_m, eight_hundred_meter_m, one_ten_hurdle_m, two_mile_m, two_hundred_meter_m)
    opponents.each do |opponent|
      points = 0
      points = self.determine_points(meet, four_hundred_hurdles_m, opponent, points, tie_points[0])
      points = self.determine_points(meet, one_hundred_meter_m, opponent, points, tie_points[1])
      points = self.determine_points(meet, sixteen_hundred_meter_m, opponent, points, tie_points[2])
      points = self.determine_points(meet, four_hundred_meter_m, opponent, points, tie_points[3])
      points = self.determine_points(meet, one_ten_hurdle_m, opponent, points, tie_points[4])
      points = self.determine_points(meet, eight_hundred_meter_m, opponent, points, tie_points[5])
      points = self.determine_points(meet, two_mile_m, opponent, points, tie_points[6])
      points = self.determine_points(meet, two_hundred_meter_m, opponent, points, tie_points[7])
      opponent.score = points
      opponent.save
    end
  end

  def self.determine_ties meet, four_hundred_hurdles_m, one_hundred_meter_m, sixteen_hundred_meter_m, four_hundred_meter_m, eight_hundred_meter_m, one_ten_hurdle_m, two_mile_m, two_hundred_meter_m
    tie_points = []
    tie_points_for_event = []
    events_array = []
    events_array << four_hundred_hurdles_m
    events_array << one_hundred_meter_m 
    events_array << sixteen_hundred_meter_m
    events_array << four_hundred_meter_m
    events_array << eight_hundred_meter_m
    events_array << one_ten_hurdle_m
    events_array << two_mile_m
    events_array << two_hundred_meter_m   

    events_array.each do |event|
      first_place_sum = 0
      second_place_sum = 0
      third_place_sum = 0
      fourth_place_sum = 0
      fifth_place_sum = 0
      tie_points_for_event = []

      event.each do |key, value|
        if key.split("_").first == "first" && value != 0
          first_place_sum += 1
        elsif key.split("_").first == "second" && value != 0
          second_place_sum += 1
        elsif key.split("_").first == "third" && value != 0
          third_place_sum += 1
        elsif key.split("_").first == "fourth" && value != 0
          fourth_place_sum += 1
        elsif key.split("_").first == "fifth" && value != 0
          fifth_place_sum += 1
        end

      end

      if first_place_sum == 1
        tie_points_for_event[0] = meet.first_regular
      elsif first_place_sum == 2
        tie_points_for_event[0] = (meet.first_regular+meet.second_regular)/first_place_sum
      elsif first_place_sum == 3
        tie_points_for_event[0] = (meet.first_regular+meet.second_regular+meet.third_regular)/first_place_sum
      elsif first_place_sum == 4
        tie_points_for_event[0] = (meet.first_regular+meet.second_regular+meet.third_regular+meet.fourth_regular)/first_place_sum
      elsif first_place_sum == 5
        tie_points_for_event[0] = (meet.first_regular+meet.second_regular+meet.third_regular+meet.fourth_regular+meet.fifth_regular)/first_place_sum
      elsif first_place_sum == 6
        tie_points_for_event[0] = (meet.first_regular+meet.second_regular+meet.third_regular+meet.fourth_regular+meet.fifth_regular+meet.sixth_regular)/first_place_sum
      end 

      if second_place_sum == 1
        tie_points_for_event[1] = meet.second_regular
      elsif second_place_sum == 2
        tie_points_for_event[1] = (meet.second_regular+meet.third_regular)/second_place_sum
      elsif second_place_sum == 3
        tie_points_for_event[1] = (meet.second_regular+meet.third_regular+meet.fourth_regular)/second_place_sum
      elsif second_place_sum == 4
        tie_points_for_event[1] = (meet.second_regular+meet.third_regular+meet.fourth_regular+meet.fifth_regular)/second_place_sum
      elsif second_place_sum == 5
        tie_points_for_event[1] = (meet.second_regular+meet.third_regular+meet.fourth_regular+meet.fifth_regular+meet.sixth_regular)/second_place_sum
      end

      if third_place_sum == 1
        tie_points_for_event[2] = meet.third_regular
      elsif third_place_sum == 2
        tie_points_for_event[2] = (meet.third_regular+meet.fourth_regular)/third_place_sum
      elsif third_place_sum == 3
        tie_points_for_event[2] = (meet.third_regular+meet.fourth_regular+meet.fifth_regular)/third_place_sum
      elsif third_place_sum == 4
        tie_points_for_event[2] = (meet.third_regular+meet.fourth_regular+meet.fifth_regular+meet.sixth_regular)/third_place_sum
      end

      if fourth_place_sum == 1
        tie_points_for_event[3] = meet.fourth_regular
      elsif fourth_place_sum == 2
        tie_points_for_event[3] = (meet.fourth_regular+meet.fifth_regular)/fourth_place_sum
      elsif fourth_place_sum == 3
        tie_points_for_event[3] = (meet.fourth_regular+meet.fifth_regular+meet.sixth_regular)/fourth_place_sum
      end

      if fifth_place_sum == 1
        tie_points_for_event[4] = meet.fifth_regular
      elsif fifth_place_sum == 2
        tie_points_for_event[4] = (meet.fifth_regular+meet.sixth_regular)/fifth_place_sum
      end

      tie_points_for_event[5] = meet.sixth_regular

      tie_points << tie_points_for_event

    end
    return tie_points
  end

  def self.determine_points meet, event, opponent, points, tie_point
    #1st place
    if event["first_place_id"] == opponent.id
      points += tie_point[0]
    end
    if event["first_place_tie_two_id"] == opponent.id
      points += tie_point[0]
    end
    if event["first_place_tie_three_id"] == opponent.id
      points += tie_point[0]
    end
    if event["first_place_tie_four_id"] == opponent.id
      points += tie_point[0]
    end
    if event["first_place_tie_five_id"] == opponent.id
      points += tie_point[0]
    end
    if event["first_place_tie_six_id"] == opponent.id
      points += tie_point[0]
    end



    if event["second_place_id"] == opponent.id
      points += tie_point[1]
    end
    if event["second_place_tie_two_id"] == opponent.id
      points += tie_point[1]
    end
    if event["second_place_tie_three_id"] == opponent.id
      points += tie_point[1]
    end
    if event["second_place_tie_four_id"] == opponent.id
      points += tie_point[1]
    end
    if event["second_place_tie_five_id"] == opponent.id
      points += tie_point[1]
    end


    if event["third_place_id"] == opponent.id
      points += tie_point[2]
    end
    if event["third_place_tie_two_id"] == opponent.id
      points += tie_point[2]
    end
    if event["third_place_tie_three_id"] == opponent.id
      points += tie_point[2]
    end
    if event["third_place_tie_four_id"] == opponent.id
      points += tie_point[2]
    end


    if event["fourth_place_id"] == opponent.id
      points += tie_point[3]
    end
    if event["fourth_place_tie_two_id"] == opponent.id
      points += tie_point[3]
    end
    if event["fourth_place_tie_three_id"] == opponent.id
      points += tie_point[3]
    end


    if event["fifth_place_id"] == opponent.id
      points += tie_point[4]
    end
    if event["fifth_place_tie_two_id"] == opponent.id
      points += tie_point[4]
    end


    if event["sixth_place_id"] == opponent.id
      points += tie_point[5]
    end


    return points
  end




  def self.hello
    puts "hello"
  end
end





# class Meet < ActiveRecord::Base
#   belongs_to :season
#   has_many :events_boys
#   has_one :scoring
#   # has_many :events_girls


#   has_many :one_hundred_meters
#   has_many :eight_hundred_meter_ms
#   has_many :four_hundred_hurdles_ms
#   has_many :four_hundred_meter_ms
#   has_many :one_hundred_meter_ms
#   has_many :one_ten_hurdle_ms
#   has_many :sixteen_hundred_meter_ms
#   has_many :two_hundred_meter_ms
#   has_many :two_mile_ms

#   has_many :opponents

#   def self.calculate_total_points meet, events
#     total_points = 0
#     events.each do |event|
#       event.first.attributes.each_pair do |key, value|
#         if key.split("_").first == "place" && value.nil? == false
#           case value
#           when "No Place"
#             points = 0
#           when "1"
#             points = meet.first_regular
#           when "2"
#             points = meet.second_regular
#           when "3"
#             points = meet.third_regular
#           when "4"
#             points = meet.fourth_regular
#           when "5"
#             points = meet.fifth_regular
#           when "6"
#             points = meet.sixth_regular
#           end
#           total_points += points
#         end 
#       end
#     end
#     if events.first.table_name == "events_boys"
#       meet.boys_total_points = total_points
#     elsif events.first.table_name == "events_girls"
#       meet.girls_total_points = total_points
#     end
#   end

#   def self.update_team_scores meet
#     opponents = meet.opponents
    
#     #four hundred hurdles
#     four_hundred_hurdles_m = meet.four_hundred_hurdles_ms.first.attributes
#     one_hundred_meter_m = meet.one_hundred_meter_ms.first.attributes
#     sixteen_hundred_meter_m = meet.sixteen_hundred_meter_ms.first.attributes
#     four_hundred_meter_m = meet.four_hundred_meter_ms.first.attributes
#     eight_hundred_meter_m = meet.eight_hundred_meter_ms.first.attributes
#     one_ten_hurdle_m = meet.one_ten_hurdle_ms.first.attributes
#     two_mile_m = meet.two_mile_ms.first.attributes
#     two_hundred_meter_m = meet.two_hundred_meter_ms.first.attributes
#     #will return an array
#     tie_points = self.determine_ties(four_hundred_hurdles_m, one_hundred_meter_m, sixteen_hundred_meter_m, four_hundred_meter_m, eight_hundred_meter_m, one_ten_hurdle_m, two_mile_m, two_hundred_meter_m)
#     opponents.each do |opponent|
#       points = 0
#       points = self.determine_points(meet, four_hundred_hurdles_m, opponent, points)
#       points = self.determine_points(meet, one_hundred_meter_m, opponent, points)
#       points = self.determine_points(meet, sixteen_hundred_meter_m, opponent, points)
#       points = self.determine_points(meet, four_hundred_meter_m, opponent, points)
#       points = self.determine_points(meet, one_ten_hurdle_m, opponent, points)
#       points = self.determine_points(meet, eight_hundred_meter_m, opponent, points)
#       points = self.determine_points(meet, two_mile_m, opponent, points)
#       points = self.determine_points(meet, two_hundred_meter_m, opponent, points)
#       opponent.score = points
#       opponent.save
#     end
#   end

#   def self.determine_ties four_hundred_hurdles_m, one_hundred_meter_m, sixteen_hundred_meter_m, four_hundred_meter_m, eight_hundred_meter_m, one_ten_hurdle_m, two_mile_m, two_hundred_meter_m
#     tie_points = []
#     tie_points_for_event = []
#     events_array = []
#     events_array << four_hundred_hurdles_m
#     events_array << one_hundred_meter_m 
#     events_array << sixteen_hundred_meter_m
#     events_array << four_hundred_meter_m
#     events_array << eight_hundred_meter_m
#     events_array << one_ten_hurdle_m
#     events_array << two_mile_m
#     events_array << two_hundred_meter_m
#     events_array.each do |event|
#       if event["first_tie_two_place_id"] != 0 && event["first_tie_three_place_id"] != 0 && event["first_tie_four_place_id"] != 0 && event["first_tie_five_place_id"] != 0 && event["first_tie_sixth_place_id"] != 0
#         tie_points_for_event[0] = 6
#       end
#     end

#   end

#   def self.determine_points meet, event, opponent, points
    
#     if event["first_place_id"] != 0
#       if event["first_place_id"] == opponent.id
#         points += meet.first_regular
#       end

#       if event["second_place_id"] == opponent.id
#         points += meet.second_regular
#       end

#       if event["third_place_id"] == opponent.id
#         points += meet.third_regular
#       end

#       if event["fourth_place_id"] == opponent.id
#         points += meet.fourth_regular
#       end

#       if event["fifth_place_id"] == opponent.id
#         points += meet.fifth_regular
#       end

#       if event["sixth_place_id"] == opponent.id
#         points += meet.sixth_regular
#       end

#     return points
#   end




#   def self.hello
#     puts "hello"
#   end
# end
