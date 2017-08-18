class Enquiry < ApplicationRecord
  FROM = "no-reply@example.com"

  belongs_to :property
  belongs_to :customer, foreign_key: :user_id
  has_many :messages
  accepts_nested_attributes_for :customer, :reject_if => :all_blank


  after_save :send_message
  before_save :set_booking_info

  validates_presence_of [
    :checkin, 
    :checkout, 
    :number_of_adults, 
    :number_of_children, 
    :number_of_infants
  ]

  def nights
    (checkout.to_date - checkin.to_date).to_i if checkin? && checkout?
  end

  def fist_message
    self.messages.first
  end


  def set_booking_info
    self.reference_number = SecureRandom.hex(4).upcase
    self.total_cost = self.property.cost * self.nights
    self.currency = self.property.currency
    self.tax = self.property.tax * self.nights
  end

  def send_message
    self.messages.create(
      from: Enquiry::FROM,
      to: self.customer.email,
      subject: "[#{self.reference_number}] Enquiry for #{self.property}",
      message_at: Time.now,
      body: self.enquiry_message
    )    
  end

  def enquiry_message
    "
      Hello #{self.customer}\n\n
      Thanks For Your Enquiry\n
      Checkin: #{self.checkin}\n
      Checkout: #{self.checkout}\n
      Guest: \n
      -Adult: #{self.number_of_adults}\n
      -Child: #{self.number_of_children}\n
      -Infant: #{self.number_of_infants}\n
    "
  end
end
