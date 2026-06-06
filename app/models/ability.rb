class Ability
  include CanCan::Ability

  def initialize(user)
    # Default: not logged in (guest)
    user ||= User.new

    # ===========================
    # GUEST (not logged in)
    # ===========================
    # Can only browse/read
    can :read, Event, status: [:published, :finished]
    can :read, Category
    can :read, Venue

    # ===========================
    # REGULAR USER (logged in)
    # ===========================
    if user.persisted?
      # Inherit guest permissions
      can :read, Event, status: [:published, :finished]
      can :read, Category
      can :read, Venue

      # Events
      can :create, Event
      can [:edit, :update, :destroy, :publish, :cancel], Event, organizer_id: user.id

      # Registrations
      can :create, Registration
      can :destroy, Registration, user_id: user.id

      # Reviews
      can :create, Review
      can :destroy, Review, user_id: user.id
    end

    # ===========================
    # ADMIN
    # ===========================
    if user.admin?
      can :manage, :all
    end
  end
end