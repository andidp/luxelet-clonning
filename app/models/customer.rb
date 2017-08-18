class Customer < User
  validates_presence_of [:full_name, :email]

  before_save :set_username

  private
  def set_username
    self.username = self.email if self.username.blank?
    self.role = "role_customer" if self.role.blank?
  end
end
