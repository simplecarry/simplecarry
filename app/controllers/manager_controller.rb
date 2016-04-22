class ManagerController < ApplicationController
   
  def requests
    @requests = current_user.requests
    @offers = current_user.offers
  end

  def trips

  end
end
