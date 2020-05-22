module Admin
  class SessionsController < Devise::SessionsController
    layout "admin/application"

    def new
      get_pre_login_url
      super
    end

    def create
      @referer_url = root_path
      super
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
  end
end