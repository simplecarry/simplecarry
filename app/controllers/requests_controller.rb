class RequestsController < ApplicationController
  before_action :load_request, only: [:show, :deposit, :item_bought, :item_delivered]

  def index
    @requests = Request.all
    if params[:location]
      @requests = Location.find_by_name(params[:location]).requests
    end
  end

  def show
  end

  def deposit
    @request.make_deposit
    redirect_to action: :show, id: params[:id]
  end

  def item_bought
    @request.item_bought
    redirect_to action: :show, id: params[:id]
  end

  def item_delivered
    @request.item_delivered
    redirect_to action: :show, id: params[:id]
  end

  private
  def load_request
    @request = Request.find_by_id(params[:id])
  end
end
