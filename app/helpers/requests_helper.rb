module RequestsHelper
  def friendly_status(request)
    message = ''
    if request.open?
      message = "<h4><span class='label label-success'>Open</span></h4>"
    elsif request.pending?
      message = "<h4><span class='label label-default'>Pending Deposit</span></h4>"
    end
    message.html_safe
  end
end
