class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end


  private

  def region_params
    params.require(:region).permit(:id)
  end

end
