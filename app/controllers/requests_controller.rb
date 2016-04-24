class RequestsController < ApplicationController
  before_action :load_request, only: [:show, :deposit, :item_bought,
                                      :item_delivered, :cancel_request,
                                      :cancel_offer, :rate, :reject,
                                      :cancel_request_manage, :cancel_offer, 
                                      :cancel_offer_manage, :rate]
  before_action :load_comment, only: [:show]
  before_action :load_request_by_id, only: [:edit, :update, :destroy]
  before_action :check_user_edit, only: [:edit, :update]
  def index
    @requests = Request.all
    unless params[:location].blank? || params[:location] == "All"
      @requests = Location.find_by_name(params[:location]).requests
    end

    if params[:order] == "Status"
      @requests = @requests.ordered_by_status
      if params[:search]
        @requests = @requests.search(params[:search])
      end
    end

    if params[:search]
      @requests = @requests.search(params[:search])
    end

  end

  def show
  end

  def edit
  end

  def update
    @request.check_validate = "active"
    if @request.update(request_params)
      flash[:success] = "Successful update the request"
      redirect_to manage_request_path
    else
      render 'edit'
    end
  end

  def deposit
    begin
      @request.make_deposit(params[:stripe_token])
      send_deposit_notification
    rescue Stripe::CardError => e
      flash[:error] = e.message
    end
    redirect_to action: :show, id: params[:id]
  end

  def item_bought
    @request.item_bought
    send_buy_item_notification
    redirect_to action: :show, id: params[:id]
  end

  def item_delivered
    @request.item_delivered
    send_deliver_item_notification
    redirect_to action: :show, id: params[:id]
  end

  def cancel_request
    @request.cancel
    send_cancel_request_notification
    redirect_to action: :index
  end

  def cancel_request_manage
    flash[:success] = "Successful cancel request"
    @request.cancel
    send_cancel_request_notification
    redirect_to manage_request_path
  end

  def reject
    @request.reject
    send_reject_notification
    redirect_to action: :show, id: params[:id]
  end

  def cancel_offer
    @request.cancel_offer
    send_cancel_offer_notification
    redirect_to action: :show, id: params[:id]
  end

  def cancel_offer_manage
    @request.cancel_offer
    send_cancel_offer_notification
    redirect_to manage_request_path
  end

  def rate
    @request.review(current_user, params[:rating])
    redirect_to action: :show, id: params[:id]
  end


  private

  def load_comment
    @comments = @request.comments
  end

  def send_deposit_notification
    DepositNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "#{@request.requester.email} has deposited money for the request <a href='#{request_url(@request)}'>#{@request.id}</a>",
        event_type: Request.statuses[:deposited])
    DepositNotification.create(
        receiver_id: @request.requester_id,
        content: "You deposited money for the request <a href='#{request_url(@request)}'>#{@request.id}</a>",
        event_type: Request.statuses[:deposited])
  end

  def send_buy_item_notification
    BuyItemNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "You bought the requested item <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:waiting_delivery])
    BuyItemNotification.create(
        receiver_id: @request.requester_id,
        content: "#{@request.selected_offer.carrier.email} bought the requested item <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:waiting_delivery])
  end

  def send_deliver_item_notification
    DeliverItemNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "You delivered the requested item <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:completed])
    DeliverItemNotification.create(
        receiver_id: @request.requester_id,
        content: "You received the requested item <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:completed])
  end

  def send_cancel_request_notification
    if @request.selected_offer
      CancelRequestNotification.create(
          receiver_id: @request.selected_offer.carrier_id,
          content: "The request #{@request.name} has been canceled")
    end
    CancelRequestNotification.create(
        receiver_id: @request.requester_id,
        content: "You canceled the requested item #{@request.name}")
  end

  def send_cancel_offer_notification
    CancelOfferNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "You canceled your offer to help on <a href='#{request_url(@request)}'>##{@request.id}</a>")
    CancelOfferNotification.create(
        receiver_id: @request.requester_id,
        content: "#{@request.selected_offer.carrier.email} canceled his offer to help you on <a href='#{request_url(@request)}'>##{@request.id}</a>")
  end

  def send_reject_notification
    RejectNotification.create(
        receiver_id: @request.selected_offer.carrier_id,
        content: "#{@request.requester.email} has rejected your offer on <a href='#{request_url(@request)}'>##{@request.id}</a>")
  end

  def load_request
    @request = Request.find_by_id(params[:id])
  end

  def request_params
    params.require(:request).permit!
  end

  def check_user_edit
    if current_user != Request.find_by_id(params[:id]).requester
      flash[:error] = "You can't edit request of other people"
      redirect_to root_path
    end
  end

  def load_request_by_id
   @request = Request.find_by_id(params[:id])
  end
end
