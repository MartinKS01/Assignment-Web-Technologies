class User < ApplicationRecord
  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id"

  has_many :registrations
  has_many :events, through: :registrations

  has_many :reviews
end