class Season < ActiveRecord::Base
  has_many :meets
  has_many :events, through: :meets 
end
