class RequestsController < ApplicationController
  before_action :load_request, only: [:show, :deposit]

  def index
    @requests = Request.all
    if params[:location]
      @requests = Location.find_by_name(params[:location]).requests
    end
    
    if params[:order] == "status"
      @requests = Request.ordered_by_status
    end
  end

  def show
  end

  def deposit
    @request.make_deposit
    redirect_to action: :show, id: params[:id]
  end

  private
  def load_request
    @request = Request.find_by_id(params[:id])
  end
end
