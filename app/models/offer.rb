class Offer < ActiveRecord::Base
  belongs_to :carrier, class_name: 'User'
  belongs_to :request

  validates :carrier, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :arrival_date, presence: true

  def status?
    request.status?
  end
end
