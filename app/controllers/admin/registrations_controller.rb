module Admin
  class RegistrationsController < Devise::RegistrationsController
    layout "admin/application"

    before_action :configure_permitted_parameters, if: :devise_controller?

    def new
      super
    end

    def edit
      render :edit
    end

    def update
      super
    end

    private

    def configure_permitted_parameters
      added_attrs = [:username, :full_name, :password, :password_confirmation, :remember_me, :email]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
  end
end