class RidesController < ApplicationController
before_action :require_logged_in

  def create
   ride = Ride.new(ride_params)
    if ride.save && !ride.take_ride
      flash[:success] = "Thanks for riding the #{ride.attraction.name}!"
      redirect_to user_path(current_user)
    else
      flash[:error] = ride.take_ride
      redirect_to user_path(current_user)
    end
  end

 private

 def ride_params
  params.require(:ride).permit(:user_id, :attraction_id)
 end
  
end
