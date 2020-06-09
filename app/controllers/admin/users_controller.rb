module Admin
  class UsersController < ApplicationController
    before_action :load_user, only: [:edit, :update, :destroy]

    def index
      add_breadcrumb "index", root_path, title: "Back to the Index"
      @users = User.all_except(current_user)
    end

    def new;end

    def destroy
      @user.destroy
      if @user.destroyed?
        flash[:success] = "Success"
      else
        flash[:error] = "Failed"
      end

      redirect_to admin_users_path
    end

    private
    def load_user
      @user = User.find_by(id: params[:id])
      redirect_to admin_users_path unless @user
    end
  end
end
