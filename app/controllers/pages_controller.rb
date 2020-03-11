class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @resources = Resource.first(8)
    @venues = Venue.all
    @venues_with_active_job_listings = []
    @venues.each do |venue|
      active_job = Job.find_by(venue: venue)
      @venues_with_active_job_listings << active_job.venue if active_job
    end
    @featured_venues = @venues_with_active_job_listings.shuffle.first(9)
  end

  def about
  end
  
end
