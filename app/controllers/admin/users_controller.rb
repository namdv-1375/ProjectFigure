module Admin
  class UsersController < ApplicationController
    def index
      add_breadcrumb "index", root_path, title: "Back to the Index"
    end
  end
end
