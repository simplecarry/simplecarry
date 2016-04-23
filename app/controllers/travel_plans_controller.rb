class TravelPlansController < ApplicationController
  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = current_user.travel_plans.new(date_params)
    if @travel_plan.save
      flash[:success] = "Your travel plan is addded successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
    @locations = Location.have_request
  end

  def destroy
    @travel_plan = TravelPlan.find_by_id(params[:id])
    @travel_plan.destroy
    redirect_to manage_trip_path
  end

  private

  def date_params
    params.require(:travel_plan).permit(:location_id, :return_date)
  end
end
