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






#all at once


# def geocode_addresses(addresses)  
#   venues_with_coords = {}
#   addresses.each do |address|  
#     url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{Rails.application.credentials.google_maps_api_key}"
#     serialized = open(url).read
#     address_serialized = JSON.parse(serialized)
#     lat = JSON.neat_generate(address_serialized["results"][0]["geometry"]["location"]["lat"])
#     lng = JSON.neat_generate(address_serialized["results"][0]["geometry"]["location"]["lng"])
#     venues_with_coords[address] = {lat: lat, lng: lng}
#     puts "-------------"
#   end
  
#   puts "Generated coordinates: \n #{JSON.neat_generate(venues_with_coords)}"
#   puts "Now saving these to VENUE_COORDINATES constant at config/initializers/wwia_constants.rb ....."
#   VENUE_COORDINATES = venues_with_coords
#   puts "Done!"
# end


# geocode_addresses(venue_addresses)


