class EventsController < ApplicationController
  def new
    @season = find_season
    @meet = find_meet(@season)
    @one_hundred_meters = @meet.one_hundred_meters.new
    @eight_hundred_meters = @meet.eight_hundred_meter_ms.new
    @racers = Racer.new

    @athletes = current_coach.athletes
    @events = ["400 Hurdles (M)", "1600 (M)", "100 (M)", "110 HH (M)", "3200 (M)", "400 (M)", "200 (M)", "800 (M)"]
    # debugger
    # debugger
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
