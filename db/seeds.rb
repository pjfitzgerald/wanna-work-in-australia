
require 'faker'
require 'csv'
require_relative '../lib/assets/geocoding_api_calls.rb'

puts 'destroying current data...'
# if Rails.env.development?
Venue.destroy_all
Region.destroy_all
Job.destroy_all
Application.destroy_all
User.destroy_all
Resource.destroy_all
# end
puts 'done.'

def import_regions
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  file_path = 'region_info/tourism_regions.csv'
  CSV.foreach(file_path, csv_options) do |row|
    region = Region.create!(name: row[:region], state: row[:state], banner: row[:banner], description: row[:description], link: row[:link])
  end
  puts "#{Region.count} regions loaded"
end

import_regions


if Rails.env.development?
  def seed_users
    Traveller.create!(first_name: "Tester", last_name: "Fitz", birthdate: "1996-02-29", email: "patrick.fitzgerald29@gmail.com", password: "123456")
    for x in (0..10) do 
      traveller = Traveller.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: "2000-01-01", email: "temp@email.com", password: "123456")
      traveller.email = "#{traveller.first_name}.#{traveller.last_name}@testing.com"
      traveller.save!

      ### commented VA creation to make traveller testing easier
      # venue_admin = VenueAdmin.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "temp@email.com", password: "123456")
      # venue_admin.email = "#{venue_admin.first_name}.#{venue_admin.last_name}@testing.com"
      # venue_admin.save!
    end
    puts "#{Traveller.count} travellers created"
    puts "#{VenueAdmin.count} venue admins created"
    puts "#{User.count} total users created"
  end
  seed_users
end

# create one test venue
test_venue = Venue.create!(name: "Test-Venue01", region_name: "Melbourne", address: "362 Beach Road; Black Rock", suburb: "Black Rock", email: "pfitz.dev@gmail.com ", link: "wwia.herokuapp.com", description: Faker::Lorem.paragraph(sentence_count: 25), banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643734/wwia/region%20banners/great_ocean_road_metp89.jpg")

def import_venues
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  file_path = 'venue_info/venue_import.csv'
  x = 1
  CSV.foreach(file_path, csv_options) do |row|
    new_venue = Venue.new(name: row[:name], region_name: row[:region_name], address: row[:address], suburb: row[:suburb], email: row[:email], link: row[:link], phone: row[:phone], banner: row[:banner], description: Faker::Lorem.paragraph(sentence_count: 25))
    if Region.find_by(name: row[:region_name]) != nil
      new_venue.save!
    else
      puts "Invalid region for venue: #{new_venue.name}! please adjust in seedfile"
    end
    x += 1
  end
  puts "#{Venue.count} venues loaded"
end

import_venues
# # populate_venue_coordinate_data

# jobs for test venue
for x in (0..25) do
  Job.create!(title: Faker::Job.title, description: Faker::Lorem.paragraph(sentence_count: 50), status: "Open", venue: test_venue)
end
def seed_jobs

  for x in (0..25) do
    Job.create!(title: Faker::Job.title, description: Faker::Lorem.paragraph(sentence_count: 50), status: "Open", venue: Venue.order('RANDOM()').first)
  end
  puts "#{Job.count} jobs created"
end

seed_jobs


# def seed_applications
#   Traveller.all.each do |traveller|
#     for x in (1..2) do 
#       Application.create!(status: "Open", traveller: traveller, job: Job.order('RANDOM()').first)
#       # for each traveller: create 2 applications for random jobs
#     end
#   end
#   for x in (0..10) do 
#     Application.create!(status: "Applied", date_applied: Date.current, traveller: Traveller.order('RANDOM()').first, job: Job.order('RANDOM()').first)
#   end
#   puts "#{Application.count} applications created"
# end

# seed_applications

### application seeding currently unnecessary


def seed_reviews
  Application.where(status: "Accepted").each do |application|
    # puts application.traveller
    # puts application.job.venue.venue_admin
    Review.create!(user: application.traveller, rating: (0..10).to_a.sample, content: Faker::Lorem.sentence, job: application.job)
    # Review.create!(user: application.job.venue.venue_admin, rating: (0..10).to_a.sample, content: Faker::Lorem.sentence, job: application.job)
  end
  puts "#{Review.count} reviews created"
end

seed_reviews




def seed_resources
  Resource.create!(
    title: "Visa Information",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358849/wwia/resource%20banners/chefstable_x2twnq.jpg")
  Resource.create!(
    title: "Superannuation",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582359031/wwia/resource%20banners/pay_resource_xlq8x6.jpg")
  Resource.create!(
    title: "Driving in Australia",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358819/wwia/resource%20banners/driving_resource_vqq0ct.jpg")
  Resource.create!(
    title: "RSA",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358878/wwia/resource%20banners/rsa_resource_fisnwh.jpg")
  Resource.create!(
    title: "Work Cover",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582359006/wwia/resource%20banners/workcover_fzfln7.jpg")
  Resource.create!(
    title: "Health",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582359021/wwia/resource%20banners/health_resource_uuser7.jpg")
  Resource.create!(
    title: "Rates of Pay",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358824/wwia/resource%20banners/finance_resource_myqdtu.jpg")
  Resource.create!(
    title: "Accommodation",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358870/wwia/resource%20banners/accom_resource_uxwblv.jpg")
  Resource.create!(
    title: "Tax File Number",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358870/wwia/resource%20banners/accom_resource_uxwblv.jpg")
  Resource.create!(
    title: "Banking",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358870/wwia/resource%20banners/accom_resource_uxwblv.jpg")
  Resource.create!(
    title: "Getting a Phone Number",
    description: "",
    banner: "https://res.cloudinary.com/dkowfxwpp/image/upload/v1582358870/wwia/resource%20banners/accom_resource_uxwblv.jpg")
  puts "#{Resource.count} resources created"
end

seed_resources






puts 'Done!'






