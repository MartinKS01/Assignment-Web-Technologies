class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :registrations
  has_many :users, through: :registrations
  has_many :reviews

  enum :status, {
    draft: 0,
    published: 1,
    cancelled: 2,
    finished: 3
  }
  
  validates :title, :start_date, :end_date, presence: true
  validates :max_attendees, numericality: { greater_than: 0 }

  validate :end_after_start

  def end_after_start
    return if start_date.blank? || end_date.blank?
    return if start_date < end_date

    errors.add(:end_date, "must be after start date")
  end
end