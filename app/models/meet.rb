class Meet < ActiveRecord::Base
  belongs_to :season
  has_many :one_hundred_meters
end
