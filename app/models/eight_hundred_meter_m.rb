class EightHundredMeterM < ActiveRecord::Base
    belongs_to :meet
    has_many :racers
end
