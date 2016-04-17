class TravelPlansController < ApplicationController
  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = current_user.travel_plans.new(date_params)
    if @travel_plan.save
      flash[:sucess] = "Add travel plan successful"
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
    @locations = Location.have_request
  end

  private

  def date_params
    params.require(:travel_plan).permit(:location_id, :return_date)
  end
end
