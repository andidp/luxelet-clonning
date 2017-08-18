module Timestampable
  include ActiveSupport::Concern

  included do
    before_create :set_time_stamp, :set_created_at
    before_update :set_time_stamp, :set_updated_at
  end

  private

  def set_created_at
    self.created_at = Time.now.to_i
  end

  def set_updated_at
    self.updated_at = Time.now.to_i
  end
end