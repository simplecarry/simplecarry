class Location < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :travel_plans

  def requests
    Request.where("selling_location_id = ?", id)
  end

  def have_request?
    !requests.empty?
  end

  def self.have_request
    location_have_request = []
    locations = Location.all
    locations.each do |location|
      if location.have_request?
        location_have_request << location
      end
    end
    location_have_request
  end

end
