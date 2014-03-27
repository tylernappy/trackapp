class Season < ActiveRecord::Base
  belongs_to :coach

  has_many :meets
  has_many :events, through: :meets 
end
