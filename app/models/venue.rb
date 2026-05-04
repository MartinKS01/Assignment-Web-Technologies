class Venue < ApplicationRecord
  has_many :events

  validates :capacity, numericality: { greater_than: 0 }
end