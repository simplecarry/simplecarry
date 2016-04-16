class Request < ActiveRecord::Base
  belongs_to :delivery_method
  belongs_to :selling_location, class_name: 'Location'
  belongs_to :delivery_location, class_name: 'Location'
  has_one :selected_offer, class_name: 'Offer'

  belongs_to :requester, class_name: 'User'

  validates :description, presence: true, if: :active_or_item?
  validates :requester, presence: true, if: :check_validate?
  validates :delivery_method_id, presence: true, if: :check_validate?
  validates :selling_location_id, presence: true, if: :check_validate?
  #validates :delivery_location, presence: true, if: :check_validate?
  validates :offer_price, presence: true, numericality: {greater_than_or_equal_to: 0}, if: :check_validate?
  validates :name, presence: true, if: :active_or_item?
  validates :quantity, presence: true
  validates :status, presence: true

  enum status: [:open, :pending, :confirmed, :accepted, :arrived, :completed]

  def can_make_new_offer?(user)
    open? && user.id != requester_id
  end

  def has_offered?
    pending?
  end

  def can_make_deposit?(user)
    has_offered? && user.id == requester_id
  end

  def make_deposit
    self.status = :confirmed
    self.save
  end

  def new_offer(user, price = self.offer_price, arrival_date = Date.now)
    if self.open?
      offer_opts = {
          carrier: user,
          request: self,
          price: price,
          arrival_date: arrival_date
      }
      offer = Offer.create(offer_opts)
      if offer.errors.empty?
        self.status = :pending
        self.save
      else
        offer.errors.each do |key|
          self.errors.add(key, offer.errors[key])
        end
      end
    else
      self.errors.add(:base, 'Can only make new offer on open request')
    end
    self
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

  def self.search(search)
    where { (name =~ "%#{search}%") | (description =~ "%#{search}%") }
  end
end
