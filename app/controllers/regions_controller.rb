class RegionsController < ApplicationController

  def index
    @regions = Region.all
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
  end


  private

  def region_params
    params.require(:region).permit(:id)
  end

end
