class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role, :type, :full_name])
  end

  def after_sign_in_path_for(resource)
    if resource.role == "partner_role"
      root_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
