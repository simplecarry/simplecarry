class Request < ActiveRecord::Base
  before_save :set_picture_url_default
  belongs_to :delivery_method
  belongs_to :selling_location, class_name: 'Location'
  belongs_to :delivery_location, class_name: 'Location'
  has_many :comments, dependent: :destroy
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

  scope :ordered_by_status, -> { order('status ASC') }

  enum status: [:open, :pending_deposit, :deposited, :waiting_delivery, :completed]

  def can_make_new_offer?(user)
    open? && user.id != requester_id
  end

  def has_offered?
    pending_deposit?
  end

  def can_make_deposit?(user)
    has_offered? && user.id == requester_id
  end

  def make_deposit(stripe_token)
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = 'sk_test_Dpwz47km7ZMFxoJi1rb2ucrJ'

    charge = Stripe::Charge.create(
        :amount => selected_offer.price,
        :currency => 'vnd',
        :source => stripe_token,
        :description => "Deposit for request #{id}"
    )
    self.status = :deposited
    self.has_deposited = true
    self.save

    charge
  end

  def item_bought
    self.status = :waiting_delivery
    self.save
  end

  def item_delivered
    self.status = :completed
    self.save
  end

  def can_make_purchase?(user)
    deposited? && user.id == self.selected_offer.carrier_id
  end

  def can_make_deliver?(user)
    waiting_delivery? && user.id == self.requester_id
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
        if self.has_deposited?
          self.status = :deposited
        else
          self.status = :pending_deposit
        end
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

  def cancel
    self.selected_offer.delete
    self.delete
  end

  def cancel_offer
    self.selected_offer.delete
    self.status = :open
    self.save
  end

  def can_give_review?(user)
    self.completed? && (can_give_requester_review?(user) || can_give_helper_review?(user))
  end

  def can_give_requester_review?(user)
    self.requester_id == user.id && Review.where(reviewer_id: user.id, request_id: self.id).empty?
  end

  def can_give_helper_review?(user)
    self.selected_offer.carrier_id == user.id && Review.where(reviewer_id: user.id, request_id: self.id).empty?
  end

  def review(user, rating)
    if can_give_review?(user)
      data = {
          reviewer_id: user.id,
          score: rating,
          offer_id: selected_offer.id,
          request_id: id
      }
      if can_give_requester_review?(user)
        data = data.merge(reviewee_id: selected_offer.carrier_id)
      elsif can_give_helper_review?(user)
        data = data.merge(reviewee_id: requester_id)
      end
      new_review = Review.create(data)
      update_score(new_review.reviewee_id)
    end
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

  def status_to_s
    self.status.capitalize.split('_').join(' ')
  end

  def set_picture_url_default
    if picture_url.blank?
      self.picture_url = "http://dummyimage.com/640/8f8f8f/ffffff"
    end 
  end

  private
  def update_score(reviewee_id)
    score = Review.where(reviewee_id: reviewee_id).average(:score)
    reviewee = User.find_by_id(reviewee_id)
    reviewee.current_score = score
    reviewee.save
  end
end
