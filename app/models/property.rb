class Property < ApplicationRecord
  validates_presence_of [:name, :description, :tax, :currency, :user_id]
  belongs_to :user
  has_many :enquiries

  #Paperclip initialization
  has_attached_file :property_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :property_image, content_type: /\Aimage\/.*\z/

  def to_s
    self.name
  end
end
