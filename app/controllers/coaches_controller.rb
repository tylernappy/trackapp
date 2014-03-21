class CoachesController < ApplicationController
  def index

  end

  def show
    @coach = find_coach
  end

  def edit
    @coach = find_coach
  end

  def update
    @coach = Coach.find(params[:id])
    if @coach.update_attributes(coach_permit)
      redirect_to @coach, notice: 'coach profile was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def find_coach
    Coach.find(params[:id])
  end

  def coach_permit
    params.require(:coach).permit(:name)
  end

end
