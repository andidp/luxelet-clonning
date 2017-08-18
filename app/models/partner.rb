class Partner < User
  has_many :properties, foreign_key: 'user_id'
  has_many :enquiries, through: :properties
  has_many :messages, through: :enquiries
end
