class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end

end
