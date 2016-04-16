class RequestsController < ApplicationController
  before_action :load_request, only: [:show]

  def index
    @requests = Request.all
    if params[:location]
      @requests = Location.find_by_name(params[:location]).requests
    end
  end

  def show
  end

  private
  def load_request
    @request = Request.find_by_id(params[:id])
  end
end
