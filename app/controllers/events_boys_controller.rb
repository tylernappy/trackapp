class EventsBoysController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @season = find_season
    @meet = find_meet(@season)
    @athletes_boys = current_coach.athletes.where(boy: true)
    @events_boys = []
    @athletes_boys.each do |athlete|
      @events_boys << @meet.events_boys.new(:athlete_id => athlete.id)
    end
    create_events_array
    # debugger
    # debugger
  end

  def create
    # debugger
    @season = find_season
    # debugger
    @meet = find_meet(@season)
    # debugger
    @events_boys = @meet.events_boys.create(events_boy_permit)
    # debugger
    # if @events_boys.save
    #   redirect_to season_meet_events_boys_path, notice: 'Season was successfully created.'
    # else
    #   render action: "new"
    # end

    # @season = find_season
    # @meet = find_meet(@season)
    # @athletes_boys = current_coach.athletes.where(boy: true)
    # @athletes_boys.each do |athlete|
    #   @meet.events_boys.find_by_athlete_id(athlete.id).create(events_boy_permit)
    # end
    # if @.save
    #   redirect_to @season, notice: 'Season was successfully created.'
    # else
    #   render action: "new"
    # end
  end

  def index
    @season = find_season
    @meet = find_meet(@season)
    @athletes_boys = current_coach.athletes.where(boy: true)
    @events_boys = []
    @athletes_boys.each do |athlete|
      @events_boys << EventsBoy.where(:athlete_id => athlete.id, :meet_id => @meet.id)
    end
    create_events_array
  end

  def edit
    @season = find_season
    @meet = find_meet(@season)
    @events_boy = EventsBoy.find(params[:id])
    @athlete = Athlete.find_by_id(@events_boy.athlete_id)
  end

  def update
    @season = find_season
    @meet = find_meet(@season)
    @events_boy = EventsBoy.find(params[:id])
    @athlete = Athlete.find_by_id(@events_boy.athlete_id)
    if @events_boy.update_attributes(events_boy_permit)
      redirect_to season_meet_events_boys_path, notice: 'Events for this athlete were successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def find_season
    Season.find(params[:season_id])
  end

  def find_meet season
    season.meets.find(params[:meet_id])
  end

  def events_boy_permit
    params.require(:events_boy).permit(:season_id, :meet_id, :athlete_id, :boys_400_m_im, :boys_1600_m, :boys_400_m, :boys_110_m_hh, :boys_800_m, :boys_3200_m, :boys_200_m, :boys_100_m, :time_minutes_400_m_im, :time_minutes_1600_m, :time_minutes_400_m, :time_minutes_110_m_hh, :time_minutes_800_m, :time_minutes_3200_m, :time_minutes_200_m, :time_minutes_100_m, :time_seconds_400_m_im, :time_seconds_1600_m, :time_seconds_400_m, :time_seconds_110_m_hh, :time_seconds_800_m, :time_seconds_3200_m, :time_seconds_200_m, :time_seconds_100_m, :time_400_decimals_m_im, :time_decimals_1600_m, :time_decimals_400_m, :time_decimals_110_m_hh, :time_decimals_800_m, :time_decimals_3200_m, :time_decimals_200_m, :time_decimals_100_m, :place_400_m_im, :place_1600_m, :place_400_m, :place_110_m_hh, :place_800_m, :place_3200_m, :place_200_m, :place_100_m)
  end

  def create_events_array
    @events = ["400 IH", "100", "1600", "400", "110 HH", "800", "3200", "200"]
  end

end