class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prénom, :nom, :ville, :téléphone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:prénom, :nom, :ville, :téléphone])
  end
end
