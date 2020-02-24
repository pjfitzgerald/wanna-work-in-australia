require 'json'
require 'open-uri'
require 'neatjson'




def geocode_address_lat(address)
  url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{Rails.application.credentials.google_maps_api_key}"
  serialized = open(url).read
  address_serialized = JSON.parse(serialized)
  lat = JSON.neat_generate(address_serialized["results"][0]["geometry"]["location"]["lat"])
  return lat
end

def geocode_address_lng(address)
  url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{Rails.application.credentials.google_maps_api_key}"
  serialized = open(url).read
  address_serialized = JSON.parse(serialized)
  lng = JSON.neat_generate(address_serialized["results"][0]["geometry"]["location"]["lng"])
  return lng
end


def populate_venue_coordinate_data
  puts "Calling google geocoding API to populate coordinates..."
  no_addresses = 0
  Venue.all.each do |venue|
    if venue.address
      venue.latitude = geocode_address_lat(venue.address)
      venue.longitude = geocode_address_lng(venue.address)
      venue.save!
    else
      no_addresses += 1
    end
  end
  puts "Coordinates updated for #{Venue.count - no_addresses} venues"
  puts "Coordinates NOT updated for #{no_addresses} venues"
end





