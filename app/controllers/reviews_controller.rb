class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @review = @event.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @event, notice: "Review submitted successfully!"
    else
      @reviews = @event.reviews.includes(:user).order(created_at: :desc)
      @user_registration = @event.user_registration(current_user)
      flash.now[:alert] = @review.errors.full_messages.join(", ")
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = @event.reviews.find(params[:id])

    unless @review.user == current_user
      redirect_to @event, alert: "You can only delete your own reviews."
      return
    end

    @review.destroy
    redirect_to @event, notice: "Review deleted."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end