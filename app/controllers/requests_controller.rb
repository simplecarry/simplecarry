class RequestsController < ApplicationController
  before_action :load_request, only: [:show, :deposit, :item_bought,
                                      :item_delivered, :cancel_request,
                                      :cancel_offer]
  before_action :load_comment, only: [:show]

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

  def cancel_request
    @request.cancel
    redirect_to action: :index
  end

  def cancel_offer
    @request.cancel_offer
    redirect_to action: :show, id: params[:id]
  end

  private
  def load_request
    @request = Request.find_by_id(params[:id])
  end

  def load_comment
    @comments = @request.comments
  end
end
