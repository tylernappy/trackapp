class Opponent < ActiveRecord::Base
  belongs_to :school
  belongs_to :meet
end
