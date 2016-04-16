class OffersController < ApplicationController
  before_action :find_request_by_id, only: [:create]

  def create
    @request.new_offer(current_user, params[:price], params[:arrival_date])
    flash[:error] = 'Unable to create offer' unless @request.errors.empty?
    redirect_to request_path(@request)
  end

  private
  def find_request_by_id
    @request = Request.find_by_id(params[:request_id])
  end
end
