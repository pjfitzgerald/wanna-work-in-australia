class VenuesController < ApplicationController


  def search
    @venues = Venue.all
    @regions = Region.all
  end

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  private

  def venue_params
    params.require(:venues).permit(:id)
  end
end
