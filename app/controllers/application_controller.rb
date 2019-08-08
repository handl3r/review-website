class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  protected

  def require_login
    unless current_user != nil
      flash[:danger] = 'Please login before'
      redirect_to new_user_session_url
    end
  end

  def require_role_company
    unless current_user.role != 'Reviewer'
      flash[:danger] = 'You are not a company'
      redirect_to static_pages_home_url
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email,
               :password,
               :current_password,
               :name,
               :address,
               :website,
               :phoneNumber,
               :description,
               :avatar)
    end
  end
end
