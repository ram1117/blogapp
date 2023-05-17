class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :udpate_allowed_parameters, if: :devise_controller?

  protected

  def udpate_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation)
    end
  end
end
