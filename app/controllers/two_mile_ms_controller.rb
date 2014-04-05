class TwoMileMsController < ApplicationController
  def edit
    find_season
    find_meet
    @two_mile_m = @meet.two_mile_ms.find(params[:id])
    @opponents = @meet.opponents

    #for drop down menu
    @schools = []
    @schools << [ "Nobody", 0]
    @opponents.each do |opponent|
      @schools << [ School.find_by_id(opponent.school_id).name, opponent.id]
    end
  end

  def update
    find_season
    find_meet
    @two_mile_m = @meet.two_mile_ms.find(params[:id])
    if @two_mile_m.update_attributes(two_mile_m_permit)
      redirect_to season_meet_path(@season, @meet), notice: 'Sixteen Hundred was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def two_mile_m_permit
    params.require(:two_mile_m).permit(:meet_id, :first_place_id, :second_place_id, :third_place_id, :fourth_place_id, :fifth_place_id, :sixth_place_id)
  end

  def find_season
    @season = Season.find(params[:season_id])    
  end

  def find_meet
    @meet = @season.meets.find(params[:meet_id])
  end
end
