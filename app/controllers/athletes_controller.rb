class AthletesController < ApplicationController
  def new
   @athlete = current_coach.athletes.new
  end

  def create
    @athlete = current_coach.athletes.create(athlete_permit)

    if @athlete.save
      redirect_to seasons_path, notice: 'Athlete was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  private
  def athlete_permit
    params.require(:athlete).permit(:name, :grade, :coach_id)
  end
end
