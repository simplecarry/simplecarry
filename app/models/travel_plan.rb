class TravelPlan < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :user, presence: true
  validates :location_id, presence: true
  validates :return_date, presence: true

end
