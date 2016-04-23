class TravelPlansController < ApplicationController
  before_action :load_travel_plan_by_id, only:[:edit, :update, :destroy]
  before_action :check_user_of_trips, only: [:edit, :update, :destroy]
  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = current_user.travel_plans.new(date_params)
    if @travel_plan.save
      flash[:success] = "Your trip is addded successfully"
      redirect_to manage_trip_path
    else
      render "new"
    end
  end

  def index
    @locations = Location.have_request
  end
  
  def edit

  end

  def update
    if @travel_plan.save
      flash[:success] = "Successful to update your trip"
      redirect_to manage_trip_path
    else
      flash.now[:error] = "Unsuccessful to update your trip"
      render 'edit'
    end
  end

  def destroy
    @travel_plan.destroy
    redirect_to manage_trip_path
  end

  private

  def date_params
    params.require(:travel_plan).permit(:location_id, :return_date)
  end

  def load_travel_plan_by_id
    @travel_plan = TravelPlan.find_by_id(params[:id])
  end

  def check_user_of_trips
    if current_user != TravelPlan.find_by_id(params[:id]).user
      flash[:error] = "You can't edit trip of other people"
      redirect_to root_path
    end
  end
end
