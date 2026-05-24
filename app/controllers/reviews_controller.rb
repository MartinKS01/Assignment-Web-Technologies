class ReviewsController < ApplicationController
  before_action :set_event
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_current_user

  def create
    @review = @event.reviews.build(review_params)
    @review.user = @current_user

    if @review.save
      redirect_to @event, notice: "Review created successfully."
    else
      flash[:alert] = @review.errors.full_messages.join(", ")
      redirect_to @event
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @event, notice: "Review updated successfully."
    else
      flash.now[:alert] = @review.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @event, notice: "Review deleted successfully."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_review
    @review = @event.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_current_user
    # For now, we'll use the first user as current user
    @current_user = User.first
  end

end