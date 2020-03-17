require_relative '../../config/initializers/wwia_constants.rb'

class RegionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @regions = Region.all
    @states = [
      ["Victoria", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643782/wwia/region%20banners/the_grampians_ojkaom.jpg"],
      ["New South Wales", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643771/wwia/region%20banners/the_murray_ffm5r7.jpg"],
      ["Queensland", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643717/wwia/region%20banners/brisbane_wemqit.jpg"],
      ["South Australia", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643705/wwia/region%20banners/barossa_valley_x0vejh.jpg"],
      ["Northern Territory", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643706/wwia/region%20banners/darwin_dirruw.jpg"],
      ["Western Australia", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643734/wwia/region%20banners/margaret_river_southwest_ljcref.jpg"],
      ["Tasmania", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643741/wwia/region%20banners/hobart_and_the_south_kqlwgg.jpg"],
      ["Australian Capital Territory", "https://res.cloudinary.com/dkowfxwpp/image/upload/v1580643701/wwia/region%20banners/canberra_and_surrounds_oced83.jpg"]
  ]
  end

  def vic
    @regions = Region.where(state: "VIC")
    render :index
  end
  
  def nsw
    @regions = Region.where(state: "NSW")
    render :index
  end
  
  def qld
    @regions = Region.where(state: "QLD")
    render :index
  end
  
  def sa
    @regions = Region.where(state: "SA")
    render :index
  end
  
  def nt
    @regions = Region.where(state: "NT")
    render :index
  end
  
  def wa
    @regions = Region.where(state: "WA")
    render :index
  end
  
  def tas
    @regions = Region.where(state: "TAS")
    render :index
  end
  
  def act
    @regions = Region.where(state: "ACT")
    render :index
  end
  


  def show
    @region = Region.find(params[:id])
    @venues = Venue.where(region: @region)
  end


  private

  def region_params
    params.require(:region).permit(:id)
  end

end
