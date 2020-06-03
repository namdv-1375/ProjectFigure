module Admin
  class SessionsController < Devise::SessionsController
    layout "admin/application"
    before_action :configure_permitted_parameters, if: :devise_controller?

    def new
      get_pre_login_url
      super
    end

    def create
      @referer_url = root_path
      super do
        unless resource.has_role? :admin
          sign_out
          flash["alert"] = "Invalid Username Or Password"
          redirect_to admin_login_path
          return
        end
      end
    end

    def destroy
      @referer_url = root_path
      super
    end

    private
    def get_pre_login_url
      @referer_url = root_path
    end

    def after_sign_in_path_for resource
      stored_location_for(resource) || root_path
    end

    def after_sign_out_path_for resource
      admin_login_path
    end

    def configure_permitted_parameters
      added_attrs = [:username, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
  end
end