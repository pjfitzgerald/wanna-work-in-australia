class VenuesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def search
    @user = current_user
    @regions = Region.all
    @venues = Venue.all
    @venue_coords = []
    @venues.each do |venue|
      sub_hash = {}
      sub_hash["name"] = venue.name
      sub_hash["latitude"] = venue.latitude
      sub_hash["longitude"] = venue.longitude
      @venue_coords << sub_hash
    end
    gon.venues = Venue.all
    venue_search
  end

  def index
    # list venues for the specific region if url is /region/:id/venues
    if params[:region_id]
      @venues = Venue.where(region: params[:region_id])
    else
      @venues = Venue.all
    end
    venue_search
  end
  
  def show
    @venue = Venue.find(params[:id])
    @jobs = Job.where(venue: @venue) if Job.where(venue: @venue) != [] 
  end

  private

  def venue_search
    @search = params["search"]
    if @search.present?
      @search_term = @search["name"]
      # @searchable = Venue.where("name ILIKE? ", "%#{@search_term}%") + Venue.where("region ILIKE? ", "%#{@search_term}%")
      @venues = Venue.where("name ILIKE? ", "%#{@search_term}%")
    end
  end

  def venue_params
    params.require(:venues).permit(:id)
  end
end
