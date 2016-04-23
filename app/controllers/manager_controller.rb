class ManagerController < ApplicationController
  before_action :authenticate_user! 
  def requests
    @requests = current_user.requests
    @offers = current_user.offers
  end

  def trips
    @travel_plans = current_user.travel_plans
  end
end
