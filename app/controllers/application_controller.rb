class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) do |u| u.permit(:email,
                                                                       :password,
                                                                       :current_password,
                                                                       :name,
                                                                       :address,
                                                                       :website,
                                                                       :phoneNumber,
                                                                       :description)
    end
  end
end
