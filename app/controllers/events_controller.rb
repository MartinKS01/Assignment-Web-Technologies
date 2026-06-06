class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :publish, :cancel]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :publish, :cancel]

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
    authorize! :create, @event
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    @event.status = :draft
    authorize! :create, @event

    if @event.save
      redirect_to @event, notice: "Event created successfully as draft."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! :edit, @event
  end

  def update
    authorize! :update, @event

    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @event
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully."
  end

  def publish
    authorize! :publish, @event

    if @event.update(status: :published)
      redirect_to @event, notice: "Event published successfully!"
    else
      redirect_to @event, alert: "Could not publish event."
    end
  end

  def cancel
    authorize! :cancel, @event

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

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :max_attendees, :category_id, :venue_id)
  end
end