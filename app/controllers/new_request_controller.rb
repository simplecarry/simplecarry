class NewRequestController < ApplicationController
  include Wicked::Wizard
  steps :item, :location, :price

  def show
    case step
      when :item
        @request = Request.new
        session[:request] = nil
      else
        @request = Request.new(session[:request])
    end
    render_wizard
  end

  def update
    case step
      when :item
        @request = current_user.requests.new(request_params)
        session[:request] = @request.attributes
        @request.check_validate = step
        if @request.valid?
          redirect_to next_wizard_path
        else
          render_wizard
        end
      when :location
        session[:request] = session[:request].merge(params[:request])
        redirect_to next_wizard_path
      when :price
        session[:request] = session[:request].merge(params[:request])
        @request = current_user.requests.new(session[:request])
        @request.check_validate = "active"
        @request.status = :open
        @request.delivery_location_id =
        if @request.save
          send_new_request_notification
          flash[:success] = "Successful to create new request"
          redirect_to root_path
        else
          render_wizard
        end
    end
  end

  private
  def request_params
    params.require(:request).permit!
  end

  def send_new_request_notification
    NewOfferNotification.create(
        receiver_id: @request.requester_id,
        content: "You created a new request <a href='#{request_url(@request)}'>##{@request.id}</a>",
        event_type: Request.statuses[:open])
  end

end
