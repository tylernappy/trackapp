class EventsController < ApplicationController
  def new
    @season = find_season
    @meet = find_meet(@season)
    @one_hundred_meters = @meet.one_hundred_meters.new

    @athletes = current_coach.athletes
  end

  def create

  end

  private
  def find_season
    Season.find(params[:season_id])
  end

  def find_meet season
    season.meets.find(params[:meet_id])
  end

end
