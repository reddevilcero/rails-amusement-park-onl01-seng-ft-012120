class AttractionsController < ApplicationController
  before_action :require_logged_in

  def index
    @attractions = Attraction.all
  end

 def show
   @attraction = Attraction.find(params[:id])
   @ride = Ride.new
 end
 

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      flash[:success] = "Attraction successfully created"
      redirect_to attraction
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    attraction = Attraction.find_by_id(params[:id])
    if attraction.update_attributes(attraction_params)
      flash[:success] = "Attraction was successfully updated"
      redirect_to attraction
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @attraction.destroy
      flash[:success] = "Attraction was successfully deleted"
      redirect_to @attractions_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @attractions_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end

end
