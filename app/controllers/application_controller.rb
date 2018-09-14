class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_return_to, unless: :devise_controller?

  def store_return_to
   store_location_for(:user, request.url)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prénom, :nom, :ville, :téléphone, :adresse, :image_profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:prénom, :nom, :ville, :téléphone, :adresse, :image_profile])
  end
end
