class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating,
            inclusion: { in: 1..5 }
  validates :comment, presence: true 
  validate :user_attended_event
  validate :event_completed

  private

  def user_attended_event
    registration = Registration.find_by(
      user: user,
      event: event,
      status: :confirmed
    )

    unless registration
      errors.add(:base, "You can only review events you attended")
    end
  end

  def event_completed
    unless event.finished?
      errors.add(:base, "You can only review completed events")
    end
  end

end