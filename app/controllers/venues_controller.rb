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

    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @venues = Venue.where("name ILIKE? ", "%#{@name}%")
    end

  end

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @jobs = Job.where(venue: @venue)
  end

  private

  def venue_params
    params.require(:venues).permit(:id)
  end
end
