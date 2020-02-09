
require 'faker'
require 'csv'

Venue.destroy_all
Region.destroy_all
Job.destroy_all
Application.destroy_all
User.destroy_all
Resource.destroy_all


def import_regions
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  file_path = 'tourism_regions.csv'
  CSV.foreach(file_path, csv_options) do |row|
    Region.create!(name: row[:region], state: row[:state], banner: row[:banner], description: row[:description], link: row[:link])
  end
  puts "#{Region.count} regions loaded"
end

import_regions



def seed_users
  Traveller.create!(first_name: "Pat The Tester", last_name: "Fitz", email: "test@test.com", password: "123456")
  for x in (0..10) do 
    traveller = Traveller.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "temp@email.com", password: "123456")
    traveller.email = "#{traveller.first_name}.#{traveller.last_name}@testing.com"
    traveller.save!
    venue_admin = VenueAdmin.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "temp@email.com", password: "123456")
    venue_admin.email = "#{venue_admin.first_name}.#{venue_admin.last_name}@testing.com"
    venue_admin.save!
  end
  puts "#{Traveller.count} travellers created"
  puts "#{VenueAdmin.count} venue admins created"
  puts "#{User.count} total users created"
end

seed_users



def import_venues
  csv_options = { col_sep: '|', quote_char: '"', headers: :first_row, header_converters: :symbol }
  file_path = 'venue_import.csv'
  CSV.foreach(file_path, csv_options) do |row|
    Venue.create!(name: row[:name], region_name: row[:region_name], address: row[:address], email: row[:email], link: row[:link], phone: row[:phone])
  end
  # FAKE DATA
  # for x in (0..30) do
  #   Venue.create!(name: Faker::Restaurant.name, description: Faker::Restaurant.description, region: Region.order('RANDOM()').first, venue_admin: VenueAdmin.order('RANDOM()').first)
  # end
  puts "#{Venue.count} venues created"
end

import_venues



def seed_jobs
  for x in (0..25) do
    Job.create!(title: Faker::Job.title, description: "This is a test job description", status: ["Open", "Filled"].sample, venue: Venue.order('RANDOM()').first)
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
  for x in (0..10) do 
    Application.create!(status: "Accepted", traveller: Traveller.order('RANDOM()').first, job: Job.order('RANDOM()').first)
  end
  puts "#{Application.count} applications created"
end

seed_applications




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
  Resource.create!(title: "Visa Information", description: Faker::Lorem.sentence)
  Resource.create!(title: "Superannuation", description: Faker::Lorem.sentence)
  Resource.create!(title: "Driving in Australia", description: Faker::Lorem.sentence)
  puts "#{Resource.count} resources created"
end

seed_resources






puts 'Done!'






