
require 'csv'




Venue.destroy_all
Region.destroy_all
Job.destroy_all
Application.destroy_all
User.destroy_all


def load_regions_from_csv
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, header_converters: :symbol }
  file_path = 'tourism_regions.csv'
  CSV.foreach(file_path, csv_options) do |row|
    # puts "#{row[:state]}: #{row[:region]}"
    Region.create!(name: row[:region], state: row[:state])
  end
  puts "#{Region.count} regions loaded"
end

load_regions_from_csv



def seed_users
  for x in (0..10) do 
    Traveller.create!(first_name: "Jerome#{x}", last_name: "
      Dingus#{x}", email: "testtraveller#{x}@test.com", password: "123456")
    VenueAdmin.create!(first_name: "Peter#{x}", last_name: "Doofus#{x}", email: "testadmin#{x}@test.com", password: "123456")
  end
  puts "#{Traveller.count} travellers created"
  puts "#{VenueAdmin.count} venue admins created"
  puts "#{User.count} total users created"
end

seed_users



def seed_venues
  for x in (0..30) do
    Venue.create!(name: "TestVenue#{x}", region: Region.order('RANDOM()').first, venue_admin: VenueAdmin.order('RANDOM()').first)
  end
  puts "#{Venue.count} venues created"
end

seed_venues


def seed_jobs
  for x in (0..25) do
    Job.create!(title: "TestTitle#{x}", venue: Venue.order('RANDOM()').first)
  end
  puts "#{Job.count} jobs created"
end

seed_jobs


def seed_applications
  Traveller.all.each do |traveller|
    for x in (1..2) do 
      Application.create!(status: "Open", traveller: traveller, job: Job.order('RANDOM()').first)
      # for each traveller: create 2 applications for random jobs
    end
  end
  puts "#{Application.count} applications created"
end

seed_applications


def seed_reviews
  
  puts "#{Review.count} reviews created"
end

seed_reviews




puts 'Done!'











