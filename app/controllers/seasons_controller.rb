class SeasonsController < ApplicationController
  def index
    if coach_signed_in?
      @seasons = Season.all
      @athletes = current_coach.athletes
    end
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.create(season_permit)

    if @season.save
      redirect_to @season, notice: 'Season was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @season = Season.find(params[:id])
    @meets = @season.meets.build
  end

  def edit
    @season = Season.find(params[:id])
  end

  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(season_permit)
      redirect_to @season, notice: 'season was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy

    redirect_to seasons_path
  end

  private
  def season_permit
    params.require(:season).permit(:spring, :winter, :year)
  end
#   before_filter :authenticate_owner!, only: [:new, :create]
#   before_filter :confirm_ownership, only: [:edit, :update, :destroy]
  
#   def welcome
  
#   end

#   def index
#     @restaurants=Restaurant.all
#   end
  
#   def new
#     if owner_signed_in?
#      @restaurant = Restaurant.new
#     end
#   end
  
#   def create
#     @restaurant = current_owner.restaurants.build(restaurant_permit)

#     if @restaurant.save
#       redirect_to @restaurant, notice: 'Restaurant was successfully created.'
#     else
#       render action: "new"
#     end
#   end
  
#   def show
#     @restaurant = Restaurant.find(params[:id])
#     @reservation = @restaurant.reservations.build
#   end

#   def edit
#     @restaurant=Restaurant.find(params[:id])
#   end

#   def update
#     @restaurant=Restaurant.find(params[:id])
#     if @restaurant.update_attributes(restaurant_permit)
#       redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
#     else
#       render action: "edit"
#     end
#   end

#   def destroy
#     @restaurant=Restaurant.find(params[:id])
#     @restaurant.destroy

#     redirect_to restaurants_path
#   end

# private
#   def restaurant_permit
#     params.require(:restaurant).permit(:name, :description, :address, :phone, :city, :state, :image)
#   end

#   def confirm_ownership
#     restaurant = Restaurant.find(params[:id])
#     if restaurant.owner != current_owner
#       redirect_to :back, flash: {:alert =>"you don't own this restaurant."}
#     end
#   end
end
