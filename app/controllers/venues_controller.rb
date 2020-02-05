class VenuesController < ApplicationController


  def search
    @user = current_user
    @venues = Venue.all
    @venue = Venue.first
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
