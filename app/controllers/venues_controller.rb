class VenuesController < ApplicationController

  def search
    @user = current_user
    @regions = Region.all
    @venues = Venue.all

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
