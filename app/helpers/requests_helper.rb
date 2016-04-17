module RequestsHelper
  def friendly_status(request)
    message = ''
    if request.open?
      message = "<h4><span class='label label-success'>Open</span></h4>"
    elsif request.pending_deposit?
      message = "<h4><span class='label label-default'>Pending Deposit</span></h4>"
    elsif request.deposited?
      message = "<h4><span class='label label-info'>Deposited</span></h4>"
    elsif request.waiting_delivery?
      message = "<h4><span class='label label-default'>Waiting Delivery</span></h4>"
    elsif request.completed?
      message = "<h4><span class='label label-success'>Completed</span></h4>"
    end
    message.html_safe
  end

  def status_name(status)
    status.gsub('_', ' ').capitalize
  end
end
