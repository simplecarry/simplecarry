class RequestsController < ApplicationController
  before_action :load_request, only: [:show]

  def index
    @requests = current_user.requests
  end

  def show
  end

  private
  def load_request
    @request = Request.find_by_id(params[:id])
  end
end
