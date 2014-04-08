class SchoolsController < ApplicationController
  def new
    @school = current_coach.schools.new
    @schools_already_created = current_coach.schools
  end

  def create
    @school = current_coach.schools.create(school_permit)

    if @school.save
      redirect_to new_coach_school_path, notice: 'School was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    find_school
  end

  def update
    find_school
    @school.update(school_permit)   
    redirect_to coach_school_path
  end

  def destroy
    find_school
    @school.destroy
    redirect_to seasons_path
  end

  def index
  end

  def show
    find_school
  end

  private
  def school_permit
    params.require(:school).permit(:coach_id, :name, :abbreviation)
  end

  def find_school
    @school = current_coach.schools.find(params[:id])
  end

end
