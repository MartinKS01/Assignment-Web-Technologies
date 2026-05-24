class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, {
    pending: 0,
    confirmed: 1,
    rejected: 2,
    waitlisted: 3
  }

  validates :user_id, uniqueness: { scope: :event_id, message: "has already registered for this event" }
  validate :event_must_be_published, on: :create

  # Callbacks
  before_create :set_registration_status
  after_destroy :promote_waitlisted_user

  private

  def set_registration_status
    if event.available_spots > 0
      self.status = :confirmed
    else
      self.status = :waitlisted
    end
  end

  def event_must_be_published
    unless event&.published?
      errors.add(:base, "Can only register for published events")
    end
  end

  def promote_waitlisted_user
    return unless confirmed?

    next_in_line = event.waitlisted_registrations.first
    next_in_line&.update(status: :confirmed)
  end
end