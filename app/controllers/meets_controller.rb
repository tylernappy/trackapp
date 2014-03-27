class MeetsController < ApplicationController
  before_filter :find_season, only: [:new]
  # before_filter :confirm_ownership, only: [:index]

  def create
    find_season
    @meet = @season.meets.create(meet_permit)
    if @meet.save
      redirect_to @season, notice: 'Season was successfully created.'
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
    # find_season
    # debugger
    # @meet = @season.meets.build
    @season = find_season
    @meet = @season.meets.find(params[:id]) 
    # debugger
    # debugger
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
