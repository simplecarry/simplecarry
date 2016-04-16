class TravelPlansController < ApplicationController
  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = current_user.travel_plans.new date_params
    if @travel_plan.save
      #TODO: redirect to search page with filter by country
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def date_params
    params.require(:travel_plan).permit(:country, :return_date)
  end
end
