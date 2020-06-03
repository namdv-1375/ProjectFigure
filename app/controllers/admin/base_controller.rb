module Admin
  class BaseController < ActionController::Base
    layout "admin/application"

    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to root_url
    end

    private

    def configure_permitted_parameters
      added_attrs = [:user_name, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
  end
end