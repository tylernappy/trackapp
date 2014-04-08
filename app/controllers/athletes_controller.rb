class AthletesController < ApplicationController
  def new
   @athlete = current_coach.athletes.new
   @athletes_already_created = current_coach.athletes.order('created_at DESC')
  end

  def create
    @athlete = current_coach.athletes.create(athlete_permit)

    if @athlete.save
      redirect_to new_coach_athlete_path, notice: 'Athlete was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    find_athlete
    @athlete.destroy
    redirect_to seasons_path
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  private
  def athlete_permit
    params.require(:athlete).permit(:name, :grade, :coach_id, :boy, :girl)
  end

  def find_athlete
    @athlete = current_coach.athletes.find(params[:id])
  end
end
