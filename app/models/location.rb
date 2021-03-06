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

  def open_requests_count
    requests.where("status = ?", 0).size
  end

  def pending_requests_count
    requests.where("status = ?", 1).size
  end

  def completed_requests_count
    requests.where("status = ?", 4).size
  end

  def traveller
    trips = TravelPlan.where("location_id = ?", id)
    travellers = []
    trips.each do |trip|
      if trip.return_date > Time.now
        travellers << trip
      end
    end
    travellers
  end

  def earliest_return_date
    array = traveller.map( &:return_date )
    array.min.strftime("%d %b %Y")
  end

end
