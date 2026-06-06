class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def dashboard
    @total_users = User.count
    @total_events = Event.count
    @total_registrations = Registration.count
    @total_reviews = Review.count
    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_events = Event.includes(:organizer, :category).order(created_at: :desc).limit(5)
    @events_by_status = Event.group(:status).count
  end

  private

  def require_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "⛔ Access denied. Admins only."
    end
  end
end