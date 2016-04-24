class OffersController < ApplicationController
  before_action :find_request_by_id, only: [:create]

  def create
    @request.new_offer(current_user, params[:price], params[:arrival_date])
    if @request.errors.empty?
      send_new_offer_notification
      
      respond_to do |format|
        format.js
        format.html {
          redirect_to request_path(@request)
        }
      end
    else
      flash[:error] = "Unable to create offer"
      respond_to do |format|
        format.js
        format.html {
          redirect_to request_path(@request)
        }
      end
    end
  end

  private
  def find_request_by_id
    @request = Request.find_by_id(params[:request_id])
  end

  def send_new_offer_notification
    NewOfferNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "You offered to help on <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:pending_deposit])
    CancelOfferNotification.create(
        receiver_id: @request.requester_id,
        content: "#{@request.selected_offer.carrier.email} offered to help you on <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:pending_deposit])
  end
end
