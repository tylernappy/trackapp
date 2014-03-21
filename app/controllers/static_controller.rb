class StaticController < ApplicationController
  def main
    # @coach = find_coach
  end

  def about
  end

  private
  def coach_params
    # params.require(:coach).permit(:name, :id)
  end

  def find_coach
    # Coach.find(params[:coach_id])
  end
end
