class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :publish, :cancel]
  before_action :set_current_user, only: [:show, :new, :create, :edit, :update, :destroy, :publish, :cancel]

  def index
    @events = Event.includes(:category, :venue, :organizer).all
  end

  def show
    @reviews = @event.reviews.includes(:user).order(created_at: :desc)
    @user_registration = @event.user_registration(current_user) if current_user
    @review = Review.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    @event.status = :draft

    if @event.save
      redirect_to @event, notice: "Event created successfully as draft."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless @event.organizer == current_user
      redirect_to @event, alert: "You can only edit your own events."
    end
  end

  def update
    unless @event.organizer == current_user
      redirect_to @event, alert: "You can only edit your own events."
      return
    end

    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless @event.organizer == current_user
      redirect_to events_path, alert: "You can only delete your own events."
      return
    end

    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully."
  end

  def publish
    unless @event.organizer == current_user
      redirect_to @event, alert: "You can only publish your own events."
      return
    end

    if @event.update(status: :published)
      redirect_to @event, notice: "Event published successfully! Users can now register."
    else
      redirect_to @event, alert: "Could not publish event."
    end
  end

  def cancel
    unless @event.organizer == current_user
      redirect_to @event, alert: "You can only cancel your own events."
      return
    end

    if @event.update(status: :cancelled)
      redirect_to @event, notice: "Event cancelled."
    else
      redirect_to @event, alert: "Could not cancel event."
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_user
    @current_user = User.first
  end

  def current_user
    @current_user
  end
  helper_method :current_user

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :max_attendees, :category_id, :venue_id)
  end
end