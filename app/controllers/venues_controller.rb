class VenuesController < ApplicationController

  def search
    @user = current_user
    @regions = Region.all
    @venues = Venue.all
    # @venues_json = @venues.to_json
    # raise

    @venue_coords = []

    # @venues.each do |venue|
    #   sub_array = []
    #   sub_array << venue.name
    #   sub_array << venue.latitude
    #   sub_array << venue.longitude
    #   @venue_coords << sub_array
    # end
    
    # @venue_coords = @venue_coords.to_json

    # raise

    venue_search
  end

  def index
    @venues = Venue.all
    venue_search
  end

  def show
    @venue = Venue.find(params[:id])
    @jobs = Job.where(venue: @venue)
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
