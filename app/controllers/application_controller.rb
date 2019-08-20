class ApplicationController < ActionController::Base
  # authentication does not go here - open by default, need to spcify in controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name, :last_name, :host,
                                             :description, :city, :country])
  end
end
