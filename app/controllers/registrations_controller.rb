class RegistrationsController < ApplicationController
  before_action :set_event
  before_action :set_current_user

  def create
    @registration = @event.registrations.build(user: current_user)

    if @registration.save
      if @registration.confirmed?
        redirect_to @event, notice: "Successfully registered for event!"
      else
        redirect_to @event, notice: "Added to waitlist. You'll be notified if a spot opens up."
      end
    else
      redirect_to @event, alert: @registration.errors.full_messages.join(", ")
    end
  end

  def destroy
    @registration = @event.registrations.find(params[:id])
    
    unless @registration.user == current_user
      redirect_to @event, alert: "You can only cancel your own registrations."
      return
    end

    @registration.destroy
    redirect_to @event, notice: "Registration cancelled successfully."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_current_user
    # For now, we'll use the first user as current user
    @current_user = User.first
  end

  def current_user
    @current_user
  end
end