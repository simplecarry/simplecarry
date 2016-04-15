class NewRequestController < ApplicationController
  include Wicked::Wizard
  steps :item, :location, :price
  
  def show
    @request = Request.new
    render_wizard
  end

  def update
    @request = Request.new
    @request.update_attributes(request_params)
    render_wizard @request
  end

  def create
    @request = Request.create
    redirect_to root_path
  end

  private
    def request_params
      params.require(:request).permit!
    end

end
