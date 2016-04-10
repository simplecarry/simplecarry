class TravelPlan < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :country, presence: true
  validates :return_date, presence: true
end
