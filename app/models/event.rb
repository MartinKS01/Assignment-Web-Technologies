class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations
  has_many :reviews, dependent: :destroy

  has_rich_text :description

  enum :status, {
    draft: 0,
    published: 1,
    cancelled: 2,
    finished: 3
  }
  
  validates :title, :start_date, :end_date, :category_id, :venue_id, :organizer_id, presence: true
  validates :max_attendees, numericality: { greater_than: 0 }
  validate :end_after_start

  def confirmed_registrations
    registrations.where(status: :confirmed)
  end

  def confirmed_count
    confirmed_registrations.count
  end

  def available_spots
    max_attendees - confirmed_count
  end

  private

  def end_after_start
    return if start_date.blank? || end_date.blank?
    return if end_date > start_date

    errors.add(:end_date, "must be after start date")
  end
end