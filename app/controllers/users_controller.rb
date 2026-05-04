class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations.includes(:event)
    @reviews = @user.reviews.includes(:event)
  end
end
