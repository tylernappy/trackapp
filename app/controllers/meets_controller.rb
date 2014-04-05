class MeetsController < ApplicationController
  before_filter :find_season, only: [:new]
  # before_filter :confirm_ownership, only: [:index]

  def create
    find_season
    @meet = @season.meets.create(meet_permit)
    if @meet.save
      @meet.four_hundred_hurdles_ms.new.save
      @meet.sixteen_hundred_meter_ms.new.save
      @meet.one_hundred_meter_ms.new.save
      @meet.four_hundred_meter_ms.new.save
      @meet.one_ten_hurdle_ms.new.save
      @meet.eight_hundred_meter_ms.new.save
      @meet.two_mile_ms.new.save
      @meet.two_hundred_meter_ms.new.save
      redirect_to new_season_meet_opponent_path(@season, @meet), notice: 'Season was successfully created.'
    else
      render action: "new"
    end
  end

  def index
    find_season
    @meets = @season.meets
  end

  def new
   find_season
   @meet = @season.meets.new
  end

  def show
    @season = find_season
    @meet = @season.meets.find(params[:id])
    @opponents = @meet.opponents.sort_by(&:score).reverse

    @boys_events = ["400 IH", "100", "1600", "400", "110 HH", "800", "3200", "200"]
    @boys_four_hundred_hurdles = @meet.four_hundred_hurdles_ms
    @boys_sixteen_hundred = @meet.sixteen_hundred_meter_ms
    @boys_one_hundred = @meet.one_hundred_meter_ms
    @boys_four_hundred = @meet.four_hundred_meter_ms
    @boys_one_hundred_ten_hurdles = @meet.one_ten_hurdle_ms
    @boys_eight_hundred = @meet.eight_hundred_meter_ms
    @boys_thirty_two_hundred = @meet.two_mile_ms
    @boys_two_hundred = @meet.two_hundred_meter_ms
  end

  def edit
    find_season
    @meet = Meet.find(params[:id])
  end

  def update
    @season = Season.find(params[:season_id])
    @meet = Meet.find(params[:id])
    if @meet.update_attributes(meet_permit)
      redirect_to season_meet_path, notice: 'meet was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @meet = Meet.find(params[:id])
    @meet.destroy

    redirect_to seasons_path
  end

  private
  def meet_permit
    params.require(:meet).permit(:season_id, :date, :location, :name, :first_relay, :second_relay, :third_relay, :first_regular, :second_regular, :third_regular, :fourth_regular, :fifth_regular, :sixth_regular)
  end

  def find_season
    @season = Season.find(params[:season_id])    
  end
end
