class OpponentsController < ApplicationController
  def new
    find_season
    find_meet
    @opponent = @meet.opponents.new
    
    @schools = []
    current_coach.schools.each do |school|
      @schools << [school.name, school.id]
    end
    @opponents_already_created = @meet.opponents.order('created_at DESC')

  end

  def create
    find_season
    find_meet
    @opponent = @meet.opponents.create(opponents_permit)
    if @opponent.save
      redirect_to new_season_meet_opponent_path(@season, @meet), notice: 'Opponent was created'
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
    find_season
    find_meet
    @opponent = @meet.opponents.find(params[:id])
    @opponent.destroy
    redirect_to new_season_meet_opponent_path
  end

  private
  def opponents_permit
    params.require(:opponent).permit(:school_id, :meet_id, :score)
  end

  def find_season
    @season = Season.find(params[:season_id])    
  end

  def find_meet
    @meet = @season.meets.find(params[:meet_id])
  end
end
