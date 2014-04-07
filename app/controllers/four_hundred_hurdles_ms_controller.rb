class FourHundredHurdlesMsController < ApplicationController
  def edit
    find_season
    find_meet
    @four_hundred_hurdles_m = @meet.four_hundred_hurdles_ms.find(params[:id])
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
    @four_hundred_hurdles_m = @meet.four_hundred_hurdles_ms.find(params[:id])
    if @four_hundred_hurdles_m.update_attributes(four_hundred_hurdles_m_permit)
      redirect_to season_meet_path(@season, @meet), notice: 'Four hundred hurdles was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def four_hundred_hurdles_m_permit
    params.require(:four_hundred_hurdles_m).permit(:meet_id, :first_place_id, :second_place_id, :third_place_id, :fourth_place_id, :fifth_place_id, :sixth_place_id, :first_place_tie_two_id, :first_place_tie_three_id, :first_place_tie_four_id, :first_place_tie_five_id, :first_place_tie_six_id, :second_place_tie_two_id, :second_place_tie_three_id, :second_place_tie_four_id, :second_place_tie_five_id, :third_place_tie_two_id, :third_place_tie_three_id, :third_place_tie_four_id, :fourth_place_tie_two_id, :fourth_place_tie_three_id, :fifth_place_tie_two_id)
  end

  def find_season
    @season = Season.find(params[:season_id])    
  end

  def find_meet
    @meet = @season.meets.find(params[:meet_id])
  end
end
