module NotificationsHelper
  def determine_sender(message)
    if message.instance_of?(DepositNotification) ||
        message.instance_of?(BuyItemNotification) ||
        message.instance_of?(DeliverItemNotification) ||
        message.instance_of?(CancelOfferNotification) ||
        message.instance_of?(CancelRequestNotification) ||
        message.instance_of?(NewOfferNotification)||
        message.instance_of?(RejectNotification)
      'System'
    end
  end
end