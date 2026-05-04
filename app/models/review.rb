class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, inclusion: 1..5
  validates :comment, presence: true
end