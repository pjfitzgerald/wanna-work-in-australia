module UserTypeHelper
  def is_traveller?(user)
    user.type == "Traveller"
  end

  def is_venue_admin?(user)
    user.type == "VenueAdmin"
  end

end