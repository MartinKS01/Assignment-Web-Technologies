class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum :role, { regular: "regular", admin: "admin" }


  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id"
  has_many :registrations
  has_many :events, through: :registrations
  has_many :reviews


  validates :first_name, :last_name, presence: true


  after_initialize :set_default_role, if: :new_record?


  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == "admin"
  end

  private

  def set_default_role
    self.role ||= :regular
  end
end