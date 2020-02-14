class VenueAdmin < User
  has_many :venues #doesn't need dependent destroy as venues can be independent
end
