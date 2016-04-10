class Offer < ActiveRecord::Base
  belongs_to :carrier, class_name: 'User'
  belongs_to :request

  validates :carrier, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :arrival_date, presence: true

  STATUS = ['Open', 'Pending', 'Confirmed', 'Accepted', 'Arrived', 'Completed']

  def status index
    STATUS[index]
  end
end
