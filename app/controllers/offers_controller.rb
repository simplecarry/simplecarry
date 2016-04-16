class OffersController < ApplicationController
  before_action :find_request_by_id, only: [:create]

  def create
    Offer.create(offer_params)
    redirect_to request_path(@request)
  end

  private
  def offer_params
    params.require(:offer).permit(:price, :arrival_date)
        .merge({
                   carrier_id: current_user.id,
                   request_id: @request.id
               })
  end

  def find_request_by_id
    @request = Request.find_by_id(params[:request_id])
  end
end
