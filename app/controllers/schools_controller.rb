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
  end

  def update
  end

  def index
  end

  def show
    @school = School.find(params[:id])
  end

  private
  def school_permit
    params.require(:school).permit(:coach_id, :name)
  end

end
