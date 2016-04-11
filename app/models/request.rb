class Request < ActiveRecord::Base
  has_one :delivery_method
  has_one :selling_location, class_name: 'Location'
  has_one :delivery_location, class_name: 'Location'
  has_one :selected_offer, class_name: 'Offer'

  belongs_to :requester, class_name: 'User'

  validates :requester, presence: true
  validates :delivery_method, presence: true
  validates :selling_location, presence: true
  validates :delivery_location, presence: true
  validates :offer_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :status, presence: true
  
  STATUS = ['Open', 'Pending', 'Confirmed', 'Accepted', 'Arrived', 'Completed']

  def status?
    STATUS[self[:status]]
  end
end
