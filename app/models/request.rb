class Request < ActiveRecord::Base
  has_one :delivery_method
  has_one :selling_location, class_name: 'Location'
  has_one :delivery_location, class_name: 'Location'
  has_one :selected_offer, class_name: 'Offer'

  belongs_to :requester, class_name: 'User'
  
  validates :description, presence: true, if: :active_or_item?
  validates :requester, presence: true, if: :check_validate?
  validates :delivery_method_id, presence: true, if: :check_validate?
  validates :selling_location_id, presence: true, if: :check_validate?
  #validates :delivery_location, presence: true, if: :check_validate?
  validates :offer_price, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: :check_validate?
  validates :name, presence: true, uniqueness: true, if: :active_or_item?
  validates :quantity, presence: true
  validates :status, presence: true
  
  STATUS = ['Open', 'Pending', 'Confirmed', 'Accepted', 'Arrived', 'Completed']

  def status?
    STATUS[self[:status]]
  end

  def check_validate?
    check_validate == 'active'
  end

  def active_or_item?
    check_validate.include?('item') || check_validate?
  end

  def active_or_location?
    check_validate.include?('location') || check_validate?
  end

  def active_or_price?
    check_validate.include?('price') || check_validate?
  end

end
