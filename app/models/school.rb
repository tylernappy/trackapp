class School < ActiveRecord::Base
  belongs_to :coach
  has_many :opponents
end
