class EventsBoy < ActiveRecord::Base
  belongs_to :meet
  belongs_to :athlete
end
