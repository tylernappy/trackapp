class Athlete < ActiveRecord::Base
  belongs_to :coach
  has_many :racers
  has_many :events_boys
  # has_many :events_girls
end
