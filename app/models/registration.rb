class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, {
    pending: 0,
    confirmed: 1,
    rejected: 2,
    waitlisted: 3
  }
end