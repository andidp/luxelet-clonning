class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @partner = current_user
    @messages = @partner.enquiries
  end
end
